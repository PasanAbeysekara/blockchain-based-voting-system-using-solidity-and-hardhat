const hre = require("hardhat");

async function main() {
  // Corrected the function name to getContractFactory
  const VotingContract = await hre.ethers.getContractFactory("Voting");
  const deployedVotingContract = await VotingContract.deploy(); // Added .deploy()

  // Wait for the contract to be deployed
  await deployedVotingContract.deployed();

  console.log(`Contract deployed to address: ${deployedVotingContract.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
