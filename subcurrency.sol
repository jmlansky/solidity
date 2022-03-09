pragma solidity >= 0.7.0 < 0.9.0;

// the contract allows ONLY the creator to create new coins
// ANYONE can send coins

contract Coin{
    address public minter;
    mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount, uint balance);
    error InsufficientBalance(uint requestedAmount, uint availableAmount);

    // The constructor runs ONLY when we deploy => the address of the "minter" will be the one assigned when deployed and no other.
    constructor(){
        minter = msg.sender;
    }

    // create new coins and add them to a receiver's balance
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // send any amount of coin to an existing address.
    function send(address receiver, uint amount) public{
        if (amount > balances[msg.sender])
            revert InsufficientBalance({ requestedAmount: amount, availableAmount: balances[msg.sender]});        

        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit Sent(msg.sender, receiver, amount, balances[receiver]);
    }
}