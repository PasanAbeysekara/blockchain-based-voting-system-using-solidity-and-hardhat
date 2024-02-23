---

# Decentralized Voting Application

## Overview

This decentralized voting application demonstrates how to implement a voting system using a Solidity smart contract and a ReactJS frontend. The application allows users to participate in secure and transparent voting, leveraging the Ethereum blockchain for integrity and traceability of votes.

## Prerequisites

Before you begin, ensure you have the following installed:
- Node.js (version 14.x or later recommended)
- npm (version 6.x or later)
- An Ethereum wallet with test Ether (for deploying contracts to test networks)

## Installation

1. **Clone the Repository**

    Start by cloning the repository to your local machine:

    ```shell
    git clone https://github.com/PasanAbeysekara/blockchain-based-voting-system-using-solidity-and-hardhat
    cd blockchain-based-voting-system-using-solidity-and-hardhat
    ```

2. **Install Dependencies**

    Install the necessary npm packages:

    ```shell
    npm install
    ```

3. **Compile and Deploy the Contract**

    Compile the smart contract and deploy it to the blockchain network (e.g., the Volta test network):

    ```shell
    npx hardhat compile
    npx hardhat run --network volta scripts/deploy.js
    ```

4. **Configure Environment**

    After deploying the contract, copy the contract address to the `.env` file. You may also specify a different blockchain network endpoint in the `hardhat-config.js` file. Ensure your private key and the deployed contract address are correctly set in the `.env` file.

5. **Start the Application**

    Launch the ReactJS application:

    ```shell
    npm start
    ```

## Features

- **Voting System**: Enables users to vote for their preferred candidates in a secure and transparent manner.
- **Blockchain Integration**: Utilizes Ethereum blockchain for deploying and interacting with the smart contract.
- **ReactJS Frontend**: Provides a user-friendly interface for interacting with the voting system.

## Contributing

Contributions to improve the application are welcome. Please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
