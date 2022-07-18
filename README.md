Even Odd Game — The Simple Gambling Smart Contract
=============

![Solidity logo](https://docs.soliditylang.org/en/v0.8.15/_static/logo.svg)


The aim of this project is to provide a simple example of Smart Contract application.



### Include ###
- This Project is written in Solidity. Find out more about Solidity on [Solidity Docs v0.8.15](https://docs.soliditylang.org/en/v0.8.15/).
- We use Truffle to test and deploy solidity Smart Contract to BSC Testnet. See [tutorial](https://itnext.io/deploying-smart-contracts-to-binance-smart-chain-with-truffle-c57a7d1eb6ed).


### Simple Workflow ###
- Someone bet on **Even** or **Odd**
- Roll the dice then give result & pay winners
- Repeat...


### Smart Contract Main Functions ###
- **deposit()** : Deposit some fund to Smart Contract. The Jackpot shouldn't be empty right? :)
- **putInEven()** : Bet on Even. You will send 0.01 test BNB to contract to play
- **putInOdd()** : Bet on Odd. You will send 0.01 test BNB to contract to play
- **endBet()** : Roll the dice then pay the winners (DOUBLE amount of their bets)
- **Others**... See the contract

### Note ###
- Please note that this contract is not for gamling purpose (Study purpose only).
- The problem is in the **rollTheDice()** function. 
- The Pseudorandom number generator from this function is **NOT** safe for gambling.
- Chainlink VRF is the best solution for now. [Check out](https://docs.chain.link/docs/chainlink-vrf/)

### Deploy on BSC Testnet ###

We made a truffle-project with mostly everything setup.
0. Clone this Project
1. Put in your [mnemonic](https://academy.binance.com/en/glossary/seed-phrase) phrase into a file named **.secret**
2. Your above wallet must have some BNB to trigger the smart contract deployment. Get some testnet BNB [Here](https://testnet.binance.org/faucet-smart)
3. Install **@truffle/hdwallet-provider** via:
```sh
npm install @truffle/hdwallet-provider
```
4. Run command and wait for magic:
```sh
truffle migrate --network bscTestnet  
```
5. Get Contract address then move to **Web3.js** to interact with it.


### Example ###
This is the deployed smart contract from BSC Testnet. Feel free to send it some funds. It's free anyway :P
[0x498B0384D00bB9ba49f4eD2C88bc257B110670bc](https://testnet.bscscan.com/address/0x498B0384D00bB9ba49f4eD2C88bc257B110670bc)


### Interact with Smart Contract ###
[See **django-even-odd-game-blockchain**](https://github.com/quyen2971997/django-even-odd-game-blockchain)

