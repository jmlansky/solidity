pragma solidity >= 0.7.0 < 0.9.0;

contract Calculator{
    function getIntegers() public pure virtual returns (uint){}
}

contract Test is Calculator{
    function getIntegers() public pure override returns (uint) { return 1+2;}
}