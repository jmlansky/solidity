pragma solidity >= 0.7.0 < 0.9.0;

contract iterations{
    function checkMultiples(uint a, uint b) public view returns (bool){
        return a%b == 0;
    }

    uint[] public numList = [1,2,3,4,5,6,7,8,9,10];
    function checkMultiplesInTheList(uint a) public view returns (uint){
        uint count = 0;
        for(uint i = 0; i< numList.length; i++){
            if (checkMultiples(a, numList[i]))
                count++;
        }

        return count;
    }

}

contract iterationsExcercise{    
    
    uint[] private list = [1,4,34,56];
    function exists(uint a) public view returns(bool){
        for(uint i = 0; i< list.length; i++){
            if (a == list[i])return true;
        }
        return false;
    }  

    uint[] private array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];    
    function numerosPares() public view returns (uint){
        uint count = 0;
        for(uint i = 0; i< array.length; i++){           
            if (array[i] %2 == 0) count++;           
        }
        return count;
    }
}