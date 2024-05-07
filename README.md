## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
# Foundry-SpacebearContract

Foundry is written in Rust, not dependent on JavaScript at all. It is blazing fast and also allows VM modifications from within solidity.

After you intiialse a Foundry project it creates the following folders:
1. src folder - contains all the contracts
2. script folder - for deployement
3. lib folder - dependencies are added as git submodules into this folder

Everything (tests, deploye scripts etc) in foundry is solidity files (not JS files like Hardhat/Truffle). Project is configured using the foundry.toml file. After building, the contract artifacts are in the out folder.

Our contract is in [src/Spacebear.sol](src/Spacebear.sol). 

To build the smart contracts, simply run `forge build`. It will compile all files and put the ABI, bytecode and AST as json files into subfolders with the name of the contracts in the out folder.

## Unit test and VM pranking

The tests in Foundry are written in Solidity. A test file is written in [test/Spacebear.test.sol](test/Spacebear.test.sol). 

VM Pranking is a special contract command that instructs the VM to run every txn from now on using the address given in the parameter as msg.sender.
`vm.prank(address)` would send the next transaction with the address given. If you do vm.startPrank(address) you can send several instructions with a new address. We can stop the pranking with `vm.stopPrank();`

VM pranking is used in our test to Mint a new NFT using the adress of the owner. Its also used to test Purchase Token functionality.


For more info refer: https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/15-foundry-testing/




