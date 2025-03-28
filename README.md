Welcome to my **FundMe** project! This is my first Solidity project as I embark on my journey to learn blockchain development using the **Cyfrin Updraft course**. The project is built using **Foundry**, a fast and modular toolkit for Ethereum application development.

## Project Overview

The **FundMe** contract is a decentralized crowdfunding platform that allows users to send ETH to the contract, tracks the amount funded by each user, and allows the contract owner to withdraw the funds. It also integrates with Chainlink price feeds to ensure that the minimum funding amount is met in USD.

### Key Features

- **Funding**: Users can send ETH to the contract using the `fund` function.
- **Price Conversion**: The contract uses Chainlink price feeds to convert ETH to USD and ensures that the minimum funding amount (5 USD) is met.
- **Tracking Funders**: The contract keeps track of all funders and the amount they have sent.
- **Owner-Only Withdrawals**: Only the contract owner can withdraw the funds.
- **Mock Testing**: Mock contracts are used for local testing to simulate Chainlink price feeds.

---

## Tools and Technologies

This project is built using the following tools and technologies:

- **Foundry**: A modular toolkit for Ethereum development.
  - **Forge**: Testing framework for smart contracts.
  - **Anvil**: Local Ethereum node for testing.
  - **Cast**: Command-line tool for interacting with smart contracts.
- **Solidity**: The programming language for writing smart contracts.
- **Chainlink**: Used for price feeds to convert ETH to USD.
- **Cyfrin Updraft Course**: A comprehensive course for learning Solidity and blockchain development.

---

## Project Structure
Here’s an overview of the project structure:

```
foundry-fundme-f25b/
├── src/
│   ├── FundMe.sol          # The main FundMe contract
│   ├── PriceConverter.sol  # Library for ETH to USD conversion
├── script/
│   ├── DeployFundMe.s.sol  # Deployment script for the FundMe contract
│   ├── HelperConfig.s.sol  # Helper script for network configuration
├── test/
│   ├── FundMeTest.t.sol    # Test suite for the FundMe contract
│   ├── Mocks/
│       ├── MockV3Aggregator.sol  # Mock Chainlink price feed for testing
├── .gitignore              # Git ignore file
├── foundry.toml            # Foundry configuration file
├── README.md               # Project documentation
```

---

## How It Works

### 1. **Funding**
Users can send ETH to the contract using the `fund` function. The contract ensures that the amount sent is above the minimum threshold (5 USD) by converting ETH to USD using Chainlink price feeds.

### 2. **Tracking Funders**
The contract keeps track of all funders and the amount they have sent using a mapping. This allows the owner to see who has contributed and how much.

### 3. **Withdrawals**
The owner of the contract can withdraw all funds using the `withdraw` function. This function resets the balances of all funders and transfers the ETH to the owner.

### 4. **Price Conversion**
The `PriceConverter` library is used to etch the latest ETH/USD price from Chainlink and convert the amount of ETH sent to its equivalent USD value.

---

## How to Use

### Prerequisites

- Install Foundry by following the instructions at [Foundry Book](https://book.getfoundry.sh/).
- Set up a `.env` file with your RPC URL and private key for deployment.

### Build the Project

```shell
forge build
```

### Run Tests

```shell
forge test
```

### Deploy the Contract
```shell
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url <your_rpc_url> --private-key <your_private_key> --broadcast
```

### Run a Local Node

```shell
anvil
```

---

## Tests

The project includes a comprehensive test suite written in Solidity using Foundry's `forge` framework. The tests cover:

- Funding functionality.
- Price feed integration.
- Owner-only withdrawals.
- Data structure updates for funders.

To run the tests:

```shell
forge test -vv
```

---

## Challenges and Learnings

This project is part of my learning journey in Solidity and blockchain development. Here are some of the key things I learned:

1. **Smart Contract Basics**:
2.  - Writing and deploying smart contracts in Solidity.
   - Using modifiers for access control.

2. **Chainlink Integration**:
   - Fetching real-world data (ETH/USD price) using Chainlink price feeds.

3. **Testing with Foundry**:
   - Writing unit tests for smart contracts.
   - Using mock contracts for local testing.

4. **Deployment**:
   - Deploying contracts to local and test networks using Foundry scripts.

---

## Acknowledgments

This project is inspired by the **Cyfrin Updraft Course**, which provides an excellent introduction to Solidity and blockchain development. Special thanks to the course creators for their guidance and resources.

---

## Future Improvements

Here are some ideas for improving the project in the future:

- Add more tests for edge cases.
- Implement a refund mechanism for funders.
- Add support for multiple price feeds (e.g., BTC/USD).
- Create a frontend for interacting with the contract.

## Connect with Me

This is my first Solidity project, and I'm excited to continue learning and building in the blockchain space! Feel free to connect with me:

- **GitHub**: [GitHub Profile](https://github.com/iEmekaa)
- **Twitter**: [Twitter Handle](https://twitter.com/iEmekaa)

---

Thank you for checking out my project!
