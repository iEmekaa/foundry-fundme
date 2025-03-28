// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdpriceFeed = helperConfig.activeNetworkConfig();

        // Start broadcasting transactions
        vm.startBroadcast();

        // Provide a valid address for the price feed
        FundMe fundMe = new FundMe(ethUsdpriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
