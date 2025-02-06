require('@nomiclabs/hardhat-ethers'); 
require('dotenv').config();  // Load environment variables from .env file

module.exports = {
  solidity: "0.8.20",
  paths: {
    sources: "./contract",  // Yeh line add karein
  },  
  networks: {
    sepoliaBase: {
      url: process.env.SEPOLIA_RPC_URL,  // Load from .env file
      accounts: [process.env.PRIVATE_KEY].filter(Boolean),  // Filter undefined values
    },
  },
};
