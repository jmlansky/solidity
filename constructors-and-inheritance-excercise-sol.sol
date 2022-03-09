pragma solidity >= 0.7.0 < 0.9.0;

contract Base {
    uint data;

    constructor(uint _data) public {
        data = _data;
    }
}

contract Derived is Base {
    constructor(uint _data) Base(_data) public {}

    function getData() public view returns(uint){
        return data;
    }
}