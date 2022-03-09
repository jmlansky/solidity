pragma solidity >= 0.7.0 < 0.9.0;

// Oracle = dynamically change outside data that feeds the smartcontracts.
// Oracle = databases - live feeding information
// Oracle => APIs

contract Oracle{
    address admin;
    uint public rand;

    constructor() public{
        admin = msg.sender;        
    }

    function setter(uint value) external{
        require(msg.sender == admin);
        rand = value;
    }
}

contract GenerateRandomNumber{
    Oracle oracle;
    constructor(address oracleAddress) public{
        oracle = Oracle(oracleAddress);        
    }
    
    function generate(uint range) public view returns(uint){
        
        //abi.encodePacked concatenates arguments
        return uint(keccak256(abi.encodePacked(oracle.rand, block.timestamp, block.difficulty, msg.sender))) % range;
    }  
}
