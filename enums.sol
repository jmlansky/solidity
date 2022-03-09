pragma solidity >= 0.7.0 < 0.9.0;

contract Enums{
    enum frenchFriesSize {SMALL, MEDIUM, LARGE}

    frenchFriesSize choice;

    frenchFriesSize constant defaultChoice = frenchFriesSize.SMALL;

    function setMedium() public {
        choice = frenchFriesSize.MEDIUM;
    }

    function getChoice() public view returns(frenchFriesSize){
        return choice;
    }

    function getDefaultChoice() public view returns (uint){
        return uint(defaultChoice);
    }
}