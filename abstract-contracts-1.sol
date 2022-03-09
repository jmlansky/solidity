pragma solidity >= 0.7.0 < 0.9.0;

// Abstract contracts are usually used as "base" contracts.
// Abstract contract contains at least 1 finction without implementation to be implemented by derived contracts.

// The contract must me defined as "abstract"
abstract contract AbstractContract{
    function x() public pure returns (string memory){ return 'Hello!!!'; }

    // Add "virtual"
    function y() public pure virtual returns(string memory);
}

contract Derived is AbstractContract{
    function y() public pure override returns(string memory){
        return "This is Overritten";
    }
}

// *** TO DEPLOY THE ABSTRACT CONTRACT, THE "BASE" CONTRACT MUST HAVE EMPTY IMPLEMENTATION "{}" FOR THE FUNCTION TO OVERRIDE!!!!. ***