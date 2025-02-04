require('@nomiclabs/hardhat-ethers');
require('@nomiclabs/hardhat-waffle');

const { sepoliaBaseRPC } = require('./testnet-rpc');  // Import RPC URL from testnet-rpc.js
const { privateKey } = require('./private-key');  // Import private key from private-key.js

module.exports = {
  solidity: "0.8.20",
  paths: {
    sources: "./contract",  // Yeh line add karein
  },
  networks: {
    sepoliaBase: {
      url: sepoliaBaseRPC,  // Base Sepolia Testnet RPC URL
      accounts: [privateKey],  // Directly use the private key without '0x'
    },
  },
};
