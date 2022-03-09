pragma solidity >= 0.7.0 < 0.9.0;

contract MappingTest{

    mapping(address => mapping(address=> uint)) allowance;    
    
    uint id = 1;

    function add(address _addrOwner, address _addrSpender) public {        
        allowance[_addrOwner][_addrSpender] = id;
        id++;
    }

    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    }

    function get(address _addrOwner, address _addrSpender) public view returns (uint){
        return allowance[_addrOwner][_addrSpender];
    }
}