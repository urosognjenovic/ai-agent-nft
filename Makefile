include .env

build:
	forge build

deploy:
	@rpc_url="$$(make --no-print-directory get-rpc-url network=$(network))"; \
	forge script script/DeployGetGift.s.sol:DeployGetGift --rpc-url "$$rpc_url" --account oldMain --broadcast

deploy-and-verify:
	@rpc_url="$$(make --no-print-directory get-rpc-url network=$(network))"; \
	forge script script/DeployGetGift.s.sol:DeployGetGift --rpc-url "$$rpc_url" --account oldMain --verify --etherscan-api-key ${ETHERSCAN_API_KEY} --broadcast

get-rpc-url:
	@case "$(network)" in \
		ethereum-sepolia) echo "${ETH_SEPOLIA_RPC_URL}" ;; \
		ethereum-mainnet) echo "${ETH_MAINNET_RPC_URL}" ;; \
		avalanche-fuji) echo "${AVALANCHE_FUJI_RPC_URL}" ;; \
		*) echo "Error: Unknown network: $(network)"; exit 1 ;; \
	esac