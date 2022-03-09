pragma solidity >= 0.7.0 < 0.9.0;

contract Array{
    uint[] array1;
    uint[] public array2;
    uint[100] array3;

    function addToArray(uint value) public{
        array1.push(value);        
    }

    function removeLastFromArray() public{
        array1.pop();
    }

    function getLength() public view returns(uint){
        return array1.length;
    }

    function getArray() public view returns(uint[] memory){
        return array2;
    }

    function remove(uint index) public {
        delete array1[index];
    }

    function changeValuesAtIndex(uint index) public {        
        array2[index] = array2[array2.length-1];
        array2.pop();        
    }

    function test() public {
        for (uint i = 1; i<=10; i++){
            array2.push(i);
        }
    }
}
