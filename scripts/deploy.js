// scripts/deploy.js
async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Wallet = await ethers.getContractFactory("Wallet", { path: "./contract/wallet.sol" });
  const wallet = await Wallet.deploy();
  console.log("Wallet contract deployed to:", wallet.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
