// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//import {Test, console} from "forge-std/Test.sol"; // you can also add console to debug and import console.log
//import {FundMe} from "../src/FundMe.sol";

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;

    function setUp() external {
        // this is a hook that runs before each test, you can also add console(argument).log
        // address mockPriceFeed = address(
        //     0x694AA1769357215DE4FAC081bf1f309aDC325306
        // );
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(fundMe.getOwner(), msg.sender);
    }

    function testPriceFeedVersionIsCorrect() public {
        uint256 version = fundMe.getVersion();
        console.log("Version: ", version); // Log the version
        assertEq(version, 4);
    }

    function testFundFailWithoutEnoughETH() public {
        vm.expectRevert();
        fundMe.fund();
        // fundMe.fund{value: 1}();
        // assertEq(fundMe.getFunderCount(), 0);
        // assertEq(fundMe.getFunderAmount(msg.sender), 0);
    }

    function testFundUpdateFundedDataStructure() public {
        // fundMe.fund{value: 5e18}();
        vm.prank(USER); // Next Tx would be sent by user
        fundMe.fund{value: SEND_VALUE}();
        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded, SEND_VALUE);
    }

    function testAddsFunderToArrayOfFunders() public {
        vm.prank(USER); // Next Tx would be sent by user
        fundMe.fund{value: SEND_VALUE}();
        address funder = fundMe.getFunder(0);
        assertEq(funder, USER);
    }

    function testOnlyOwnerCanWithdraw() public {
        vm.prank(USER); // Next Tx would be sent by user
        fundMe.fund{value: SEND_VALUE}();
        vm.prank(USER); // Next Tx would be sent by user
        vm.expectRevert();
        fundMe.withdraw();
    }

    function testWithdrawWithASingleFunder() public {
        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        vm.prank(fundMe.getOwner()); // Next Tx would be sent by owner
        fundMe.withdraw();

        uint256 endingOwnerBalance = fundMe.getOwner().balance;
        uint256 endingFundMeBalance = address(fundMe).balance;
        assertEq(endingFundMeBalance, 0);
        assertEq(
            endingOwnerBalance,
            startingOwnerBalance + startingFundMeBalance
        );
    }
}
