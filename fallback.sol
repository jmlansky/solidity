pragma solidity >= 0.7.0 < 0.9.0;

/*
    1- Fallback functions are anonymous
    2- Fallback functions does NOT take parameters (inputs)
    3- Fallback functions does NOT return values (outputs)
    4- Fallback functions MUST be declared EXTERNAL
*/


contract FallBack{
    event Log(uint gas);
    
    fallback () external payable{
        // DO NOT WRITE TOO MUCH CODE INSIDE THE FALLBACK FUNCTIONS --> the function will fail if uses too much gas
        // when invoke "send" method, use 2300 gas --> enaugh to emit a log.
        // when invoke "call" method, use ALL the gas --> try to avoid it
        
        //use solidity function "gasleft"
        emit Log(gasleft());
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}

//send eth to fallback contract to trigger the fallback function
contract SendToFallback{
    function TransferToFallback(address payable _to)public payable{
        _to.transfer(msg.value);
    }

    function CallToFallback(address payable _to)public payable{
       (bool sent, ) = _to.call{value: msg.value}('');
       require(sent, 'Faled to Send!!');
    }
}
