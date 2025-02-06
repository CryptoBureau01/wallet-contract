async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy the Wallet contract
  const Wallet = await ethers.getContractFactory("Wallet");
  const wallet = await Wallet.deploy();
  console.log("Deploying contract...");

  // Wait for the deployment transaction to be mined
  try {
    const tx = await wallet.deployTransaction.wait(); // Wait until the contract is mined
    console.log("Wallet contract deployed to:", wallet.address);
    console.log("Transaction hash:", wallet.deployTransaction.hash);
  } catch (error) {
    console.error("Error during deployment:", error);
    process.exit(1);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error during deployment:", error);
    process.exit(1);
  });
