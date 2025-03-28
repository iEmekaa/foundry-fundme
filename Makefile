-include .env

deploy-sepolia:; forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --broadcast --private-key $(PRIATE_KEY)--etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
