pragma solidity >= 0.7.0 < 0.9.0;

// 1. declare Events
// 2. emit Events
contract Events{    

    // 1. declare the Event
    event NewTrade(
        uint date,
        address sender,
        address indexed receiver, // "indexed" allow the external user to filter by field, can be up tu 3 "indexed" variables and increase the gas fee
        uint amount
    );

    function trade(address to, uint amount) external {
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
}