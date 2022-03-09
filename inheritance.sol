pragma solidity >= 0.7.0 < 0.9.0;

contract Parent{
    uint internal innerVal = 100;

    function innerAddTen(uint value) public pure returns(uint){ return value + 10; }
}

contract Child is Parent{

    function outerAddTen(uint value) public pure returns (uint){ return innerAddTen(value); }
    function getInnerVal() public view returns(uint){ return innerVal; }
}