pragma solidity >= 0.7.0 < 0.9.0;

contract MyContract{

    uint value;
    function setValue(uint _value) external {
        value = _value;
    }

    function getValue() external view returns(uint){ // 'VIEW' is read-only modifier
        return value;
    }

    function getValuePlusThree() external view returns(uint){ // 'VIEW' is read-only modifier
        return value + 3;  // the 'VALUE' is not being changed, so uses VIEW instead of PURE
    }

    function multiply() external pure returns(uint){  // 'PURE' returns calculations *** BUT *** not changing states
        return 3*7;
    }

    function add(uint _value) external { 
        value += _value;        
    }
}