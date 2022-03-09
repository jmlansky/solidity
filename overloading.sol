pragma solidity >= 0.7.0 < 0.9.0;

contract FunctionOverloading{
    function getSum(uint a, uint b) private pure returns (uint){
        return a+b;
    }

    function getSum(uint a, uint b, uint c) private pure returns (uint){
        return a+b+c;
    }

    function getSum2Result() public pure returns (uint){
        return getSum(2, 3);
    }
    function getSum3Result() public pure returns (uint){
        return getSum(1, 2, 3);
    }
}