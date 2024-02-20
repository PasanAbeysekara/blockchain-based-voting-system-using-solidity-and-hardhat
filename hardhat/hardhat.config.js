require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const { PRIVATE_KEY, POLYGON_MUMBAI_RPC_URL, ETHERSCAN_API_KEY } = process.env;

module.exports = {
  solidity: "0.8.24",
  networks: {
    mumbai: {
      url: POLYGON_MUMBAI_RPC_URL, // Make sure this is correctly set in your .env file
      accounts: [PRIVATE_KEY], // Your private key
      chainId: 80001, // Explicitly set the chain ID for Mumbai
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
