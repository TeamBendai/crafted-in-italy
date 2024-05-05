Running a Private Ethereum Blockchain using Docker
--------------------
Put genesis.json, Dockerfile, docker-compose.yml and .env files together in the same folder. Then run the command.

```
docker-compose up
```

https://medium.com/@pradeep_thomas/how-to-setup-your-own-private-ethereum-network-f80bc6aea088

https://medium.com/scb-digital/running-a-private-ethereum-blockchain-using-docker-589c8e6a4fe8

https://hemantkgupta.medium.com/how-to-build-an-ethereum-private-blockchain-network-using-geth-and-docker-41f2ce8d6f6e


https://hardhat.org/hardhat-runner/docs/config#hd-wallet-config

https://www.quicknode.com/guides/ethereum-development/smart-contracts/how-to-setup-local-development-environment-for-solidity/how-to-setup-local-development-environment-for-solidity


# Come collegarsi alla blockchain
1. entrare con exec sul servizio `geth-rpc-endpoint` ad esempio con `docker exec -it runningaprivateethereumblockchainusingdocker-geth-rpc-endpoint-1 sh`
2. lanciare il comando `geth attach`
```
/ # geth attach
Welcome to the Geth JavaScript console!

instance: Geth/v1.10.1-stable-c2d2f4ed/linux-amd64/go1.16
coinbase: 0x3506a68391e55de4549f5c5eda3801d397f121a8
at block: 1313 (Mon Apr 29 2024 05:28:41 GMT+0000 (UTC))
 datadir: /root/.ethereum
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d
> eth.accounts
["0x3506a68391e55de4549f5c5eda3801d397f121a8"]
> personal.newAccount()
Passphrase: 
Repeat passphrase: 
"0xff80c6e46acebbdc4d78be50aa84963707559cb4"
> 
> personal.unlockAccount("0xff80c6e46acebbdc4d78be50aa84963707559cb4")
Unlock account 0xff80c6e46acebbdc4d78be50aa84963707559cb4
Passphrase: 
true


/ # 
/ # geth account new
INFO [04-29|12:13:06.375] Maximum peer count                       ETH=50 LES=0 total=50
INFO [04-29|12:13:06.377] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"
Your new account is locked with a password. Please give a password. Do not forget this password.
Password: 
Repeat password: 

Your new key was generated

Public address of the key:   0x9837721C2c2869F5a0D2E2611905849Faed4E07D
Path of the secret key file: /root/.ethereum/keystore/UTC--2024-04-29T12-13-24.597408716Z--9837721c2c2869f5a0d2e2611905849faed4e07d

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!

/ # geth attach
Welcome to the Geth JavaScript console!

instance: Geth/v1.10.1-stable-c2d2f4ed/linux-amd64/go1.16
coinbase: 0x3506a68391e55de4549f5c5eda3801d397f121a8
at block: 4842 (Mon Apr 29 2024 12:14:59 GMT+0000 (UTC))
 datadir: /root/.ethereum
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

To exit, press ctrl-d
> personal.unlockAccount("0x9837721C2c2869F5a0D2E2611905849Faed4E07D")
Unlock account 0x9837721C2c2869F5a0D2E2611905849Faed4E07D
Passphrase: 
GoError: Error: could not decrypt key with given password at web3.js:6347:37(47)
        at native
        at <eval>:1:24(3)

> personal.unlockAccount("0x9837721C2c2869F5a0D2E2611905849Faed4E07D")
Unlock account 0x9837721C2c2869F5a0D2E2611905849Faed4E07D
Passphrase: 
true
> 
```

passwordComplicata

