# Prepare the environment
Follow this guide: https://hardhat.org/tutorial/setting-up-the-environment
```shell
nvm install 20
nvm use 20
npm init
npm install --save-dev hardhat
npx hardhat init
```

# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
npx hardhat ignition deploy ./ignition/modules/Lock.js --network localhost
```
