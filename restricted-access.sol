pragma solidity >= 0.7.0 < 0.9.0;

contract RestrictedAccess{
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    modifier OnlyBy(address account){
        require (account == msg.sender, 'Sender not authorized!!');
        _; 
    }    

    modifier OnlyAfter(uint timePeriod){
        require(block.timestamp >= timePeriod, 'Function called too early!!');
        _;
    }

    modifier costs(uint _amount){
        require(msg.value >= _amount, 'Not enaugh ETH provided');
        _;
    }

    function changeOwner(address newAddress) public OnlyBy(owner){
        owner = newAddress;
    }

    function disown() public OnlyBy(owner) OnlyAfter(creationTime + 3 weeks){
        delete owner;
    }

    function forceOwnerChange(address payable newOwner) public payable costs(200 ether){
        owner = newOwner;
    }  

    function send(address payable receiver) public payable returns (bool){
        require(msg.sender == owner);

        //send to the receiver the amount of value
        receiver.send(msg.value);

        return true;
    }
}