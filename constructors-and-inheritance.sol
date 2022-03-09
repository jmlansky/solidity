pragma solidity >= 0.7.0 < 0.9.0;

contract Member {
    string name;
    uint age;

    constructor(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }
}

contract Teacher is Member {
    constructor(string memory _name, uint _age) Member(_name, _age) public {}

    function getName() public view returns(string memory){
        return name;
    }
}