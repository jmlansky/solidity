pragma solidity >= 0.7.0 < 0.9.0;
/*
contract test{
    address[] public funders;
    mapping(address=> uint) aaa;

    address owner;

    //a default fallback function is NOT payable and will reject funds --> will fail
    fallback() external{}

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner{
        require (owner == msg.sender);
        _;
    }  

    function returnFunds() public payable onlyOwner returns(bool){

        for(uint i = 0; i< funders.length; i++){
            funders[i].transfer(contributedAmount);
        }        

        return true;
    }
}*/


contract Victim{
    function isItAContract() public view returns(bool){
        uint32 size;
        address a = msg.sender;

        // inline 'assembly' accesses EVM (Ethereum Virtual Machine) at a low level.
        assembly { 
            // extcodesize retrieves the size of the code
            size := extcodesize(a) 
        }
        return(size>0);
    }    
}

//ISSUE: If call the address from the constructor => there are no byte codes --> EMPTY CONTRACT, NO FUNCTIONS, NO ANYTHING
contract Attacker{
    bool public tricker;
    Victim victim;
    
    constructor(address v) public {
        victim = Victim(v);
        tricker = !victim.isItAContract();
    }
}

contract SendTest{
    mapping(address => uint) balance;
    address owner;
    address fixedReveiver;
    constructor(address receiver) public {
        owner = msg.sender;
        fixedReveiver = receiver;
    }

    function sender(address payable receiver) public payable returns (bool){
        require(msg.sender == owner);
        require(receiver == fixedReveiver);
        receiver.send(msg.value);

        return true;
    }

    function claimFunds()public payable{
        require(balance[msg.sender] > 0);
        payable(msg.sender).transfer(balance[msg.sender]);
    }
}