pragma solidity ^0.8.4;

contract Coin {
    // The keyword "public" makes variables accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;

    // Events allow clients to react to specific contract changes you declare.
    /* 'Event' is an inheritable member of a contract. 
        - An event is emitted.
        - It stores the arguments passed in transaction logs. 
        - These logs are stored on blockchain and are accessible using address of the contract until the contract is present on the blockchain. 
    */ 
    event Sent(address from, address to, uint amount, uint curBalance);

    // Errors allow you to provide information about why an operation failed. They are returned to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
    }
   
    // Can ONLY be called by the contract creator
    // Adds coins to the receiver's account
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    
    // Send coins FROM the sender TO the Receiver's balance
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount, balances[receiver]);
    }
}