pragma solidity >= 0.7.0 < 0.9.0;

contract Test{
    mapping(address => uint) balance;

    function withraw(uint amount) public returns (bool success){
        require(balance[msg.sender] >= amount);        
        payable(msg.sender).transfer(amount);  
        balance[msg.sender] -= amount;              
        return true;
    }

    function claimFunds()public payable{
        require(balance[msg.sender] > 0);
        payable(msg.sender).transfer(balance[msg.sender]);
    }
}