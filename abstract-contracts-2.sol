pragma solidity >= 0.7.0 < 0.9.0;

contract Member{ // NO NEED to be ABSTRACT if the function has empty implementation
    string name;
    uint age = 38;

    function setName() public virtual returns(string memory){} // EMPTY implementation

    function returnAge() public view returns(uint){ return age;}
}

contract Derived is Member{
    function setName() public override pure returns(string memory){ return 'Name!!!'; }
}