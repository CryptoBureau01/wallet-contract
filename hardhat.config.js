require('@nomiclabs/hardhat-ethers');
require('@nomiclabs/hardhat-waffle');

const { sepoliaBaseRPC } = require('./testnet-rpc');  // Import RPC URL from testnet-rpc.js
const { privateKey } = require('./private-key');  // Import private key from private-key.js

module.exports = {
  solidity: "0.8.20",
  networks: {
    sepoliaBase: {
      url: sepoliaBaseRPC,  // Base Sepolia Testnet RPC URL
      accounts: [`0x${privateKey}`],  // Replace with your private key
    },
  },
};
