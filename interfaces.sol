pragma solidity >= 0.7.0 < 0.9.0;

contract Counter{
    uint public count;

    function increment() external {
        count +=1;
    }
}

interface ICounter{
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract{
    function incrementCounter(address counter) external{
        // the "binder" between the interface and the contract is through thr address
        // this will count how many times certain address is repeated
        ICounter(counter).increment();
    }

    function getCount(address counter) external view returns (uint){
        // the "binder" between the interface and the contract is through thr address
        return ICounter(counter).count();
    }
}