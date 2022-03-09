pragma solidity >= 0.7.0 < 0.9.0;

contract Mapping{
    mapping(address => uint) myMap;

    function setAddress(address _address, uint _value) public{
        myMap[_address] = _value;
    }

    function getAddress(address _address) public view returns (uint) {
        return myMap[_address];
    }

    function removeAddress(address _address) public {
        delete myMap[_address];
    }
}