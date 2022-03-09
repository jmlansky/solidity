pragma solidity >= 0.7.0 < 0.9.0;

contract WelcomeToSolidity{
    constructor() public{}

    function getResult(uint a, uint b) public view returns(uint){        
        return add(a,b);
    }

    function add(uint a, uint b) private view returns(uint)
    {
        return a+b;
    }

    function CheckRequire(uint a, uint b) view public{
        require(a>b, 'not true');        
    }
}