pragma solidity >= 0.7.0 < 0.9.0;

contract LedgerBalance{
    mapping(address=> uint) balances;

    /// Update the amount of a sender and returns the total amount of the balance
    function updateBalance(uint amount) public{        
        balances[msg.sender] = amount;
    }

    function getBalance() public view returns(uint){        
        return balances[msg.sender];
    }
}

contract Updater is LedgerBalance{
    constructor() {
        ledger = new LedgerBalance();
    }

    LedgerBalance ledger;
    function update(uint amount) public{        
        
        uint currentBalance = ledger.getBalance();
        ledger.updateBalance(currentBalance + amount);
    }

    function getter() public view returns(uint){
        return ledger.getBalance();
    }
}


contract Storage {
    struct Object{
        uint storedData;
        uint difficulty;
        uint timestamp;
    }
    
    Object obj;

    function set(uint value) public{    
        obj.storedData = value;    
        obj.difficulty = block.difficulty;
        obj.timestamp = block.timestamp;
    }

    function get() public view returns(Object memory){
        return obj;
    }
}