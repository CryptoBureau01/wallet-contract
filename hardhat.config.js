require('@nomiclabs/hardhat-ethers'); 
require('@nomicfoundation/hardhat-toolbox');
require('@nomicfoundation/hardhat-verify');
require('dotenv').config();  // Load environment variables from .env file

module.exports = {
  solidity: "0.8.20",
  paths: {
    sources: "./contract",  // Yeh line add karein
  },  
  networks: {
    sepoliaBase: {
      url: process.env.RPC_URL,  // Load from .env file
      accounts: [process.env.PRIVATE_KEY].filter(Boolean),  // Filter undefined values
    },
  },
  etherscan: {
    apiKey: process.env.API_KEY,  // Load API key from .env file
  },
};
