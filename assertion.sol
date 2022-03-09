pragma solidity >= 0.7.0 < 0.9.0;

contract testAssert{
    function test () public {
        assert(1000000000000000000 wei == 1 ether);
        assert(1 ether == 1e18 wei);
    }

    function testTime() public{
        assert(3600 seconds == 1 hours);
        assert(60 minutes == 1 hours);
    }
}