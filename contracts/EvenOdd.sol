// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;


contract EvenOdd {

    address owner;
    address host;
    uint constant public DEFAULT_BET_AMOUNT = 0.01 ether;
    uint public gameId;
    uint dice = 0;
    mapping (uint => uint) public gameHistory;
    uint constant public BET_TIMEOUT = 5 minutes;
    
    address payable[] public arrayPlayerOdd;
    address payable[] public arrayPlayerEven;

    constructor () {
        owner = msg.sender;
        gameId = 0;
    }

    modifier isHost(){
        require(msg.sender == host || msg.sender == owner);
        _;
    }

    modifier isValidBet(){        
        require(msg.value >= DEFAULT_BET_AMOUNT, "Not enough Bet Amount");
        _;
    }


    modifier isEnoughFund(){
        require(address(this).balance >= DEFAULT_BET_AMOUNT * arrayPlayerEven.length);
        require(address(this).balance >= DEFAULT_BET_AMOUNT * arrayPlayerOdd.length);
        _;
    }

    function resetRound() public {
        arrayPlayerOdd = new address payable[](0);
        arrayPlayerEven = new address payable[](0);
        gameId++;
    }

    function getFund() public view returns (uint) {
        return address(this).balance;
    }

    function getOddPlayers() public view returns (address payable[] memory ) {        
        return arrayPlayerOdd;
    }

    function getEvenPlayers() public view returns (address payable[] memory ) {        
        return arrayPlayerEven;
    }

    function getTotalPlayers() public view returns (uint) {
        return arrayPlayerEven.length + arrayPlayerOdd.length;
    }

    function putInEven() public  isValidBet payable{
        arrayPlayerEven.push(payable(msg.sender));
    }

    function putInOdd() public isValidBet payable{
        arrayPlayerOdd.push(payable(msg.sender));
    }


    function rollTheDice() public view returns (uint){
        
        uint _dice = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty, msg.sender))) % 6 + 1;
        // _dices[1] = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty, msg.sender))) / 10 % 6 + 1;
        // _dices[2] = uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty, msg.sender))) / 100 % 6 + 1;
        // this method isn't safe. Use Chainlink VRF instead        
        return _dice;        
    }

    function deposit() public payable {
    }    

    function endBet() public isEnoughFund{
        // check winner
        dice = rollTheDice();        
        if (dice % 2 == 0) {
            // pay even players
            for (uint index = 0; index < arrayPlayerEven.length; index++) {
                arrayPlayerEven[index].transfer(DEFAULT_BET_AMOUNT * 2);
            }
        }
        else {
            // pay odd players            
            for (uint index = 0; index < arrayPlayerOdd.length; index++) {
                arrayPlayerOdd[index].transfer(DEFAULT_BET_AMOUNT * 2);
            }
        }
        gameHistory[gameId] = dice; // save game history
        resetRound();

    }
}
