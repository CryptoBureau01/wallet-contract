# ERC-20 Wallet-Contract with CryptoBureau

## This contract is an ERC-20 Wallet Contract that can be deployed on any ERC-20 compatible blockchain such as ETH, BNB, Polygon, Arbitrum, Base, and more. The contract includes a set of functions designed to facilitate easy management of native and token assets within the wallet.

_________________________________________________________________________________________________________________________________________________________________


# How to Set Up the Contract in Node.js

First, make sure that Node.js 20 is installed on your system. Run this command to check the version:

  ```bash
  node -v
  ```

After that, follow these steps:

---

## Step 1. Set Up the .env File

First, you need to set your private key and the RPC URL of the network where you want to deploy the contract in the `.env` file.

- **Windows User**: If you are using a Windows system, open the `wallet-contract` folder in VS Code and edit the `.env` file.
- **Linux User**: If you are using Linux, navigate to the `wallet-contract` folder and run the `nano .env` command to edit the `.env` file.

You need to configure three things in the `.env` file:

```env
# Your private key for deploying the contract
PRIVATE_KEY=your_private_key_here

# RPC URL of the network you want to deploy your contract on
RPC_URL=https://your_rpc_url_here

# API key for contract verification (obtain it from the network's explorer)
API_KEY=your_api_key_here
```

---

## Step 2. Install Dependencies

After completing Step 1, you need to run `npm install` in your terminal.

- **Windows User**: If you're using Windows, open the terminal in VS Code within the `wallet-contract` folder and run the command.
- **Linux User**: If you're using Linux, open the terminal within the `wallet-contract` folder and run the command.

```bash
npm install
```

This will install all the dependencies listed in the `package.json` file.

---

## Step 3. Compile and Deploy the Contract

After installing the dependencies, you'll need to compile and deploy your contract to the blockchain.

### 1. Compile the Contract:

Run the following command to compile your contract:

```bash
npx hardhat compile
```

### 2. Deploy the Contract:

Then, deploy the contract by running this command:

```bash
npx hardhat run scripts/deploy.js --network your_network_name
```

Replace `your_network_name` with the name of the network defined in your `hardhat.config.js`.

### 3. Verify the Contract:

If you want to verify your contract on Etherscan or another blockchain explorer, you can run the following command:

```bash
npx hardhat verify --network your_network_name <contract_address>
```

---

By following these steps, you should be able to set up and deploy your ERC-20 Wallet Contract using `Node.js` and `Hardhat`. Make sure your `.env` file is correctly configured and dependencies are installed before proceeding with contract deployment.

_________________________________________________________________________________________________________________________________________________________________


## Functions:
    1. Owner DepositNative
      Allows the owner to deposit native cryptocurrency (like ETH, BNB, etc.) into the wallet.

    2. Owner WithdrawNative
      Allows the owner to withdraw native cryptocurrency from the wallet.

    3. Owner AddToken
      Enables the owner to add new tokens to the wallet. This function is used for integrating additional ERC-20 tokens that the wallet will support.

    4. Owner RemoveToken
      Allows the owner to remove tokens from the wallet that are no longer needed or supported.

    5. Owner DepositToken
      Enables the owner to deposit ERC-20 tokens into the wallet.

    6. Owner WithdrawToken
      Allows the owner to withdraw ERC-20 tokens from the wallet.

    7. OwnerTransfer
      Allows the owner to transfer ownership of the wallet to a new address.

    8. GetBalance
      A public function to retrieve the wallet's balance of native cryptocurrency (ETH, BNB, etc.).

    9. ViewBalance
      A public function to view the balance of specific ERC-20 tokens stored in the wallet.

    10. AllowToken
      This function checks whether a particular ERC-20 token is allowed and supported by the wallet.

This wallet contract has been designed with long-term usability in mind, allowing the owner to manage native and token-based assets in a secure and efficient manner. The functions are structured to ensure easy operation, whether you are depositing, withdrawing, or managing token allowances.

The contract is flexible and can be deployed on multiple blockchains that support ERC-20 tokens. You can add or remove tokens as required, and the wallet remains highly customizable for any user with ownership privileges.

_________________________________________________________________________________________________________________________________________________________________



