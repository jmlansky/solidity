pragma solidity >= 0.7.0 < 0.9.0;

contract handlStrings{
    string greetings = 'Hello World!';

    function SayHello() public view returns (string memory){
        return greetings;
    }

    function Change(string memory newText) public{
        greetings = newText;       
    }

    function GetLength() public view returns (uint){
        //bytes memory myString = bytes(greetings);
        return bytes(greetings).length; // myString.length;
    }
}