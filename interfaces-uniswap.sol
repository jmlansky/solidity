pragma solidity >= 0.7.0 < 0.9.0;

interface IUniswapV2Factory{
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface IUniswapV2Pair{
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract TradingSMRTContract {
    // the Uniswap factory is deployed in *** PRODUCTION ***  at the following ethereum address: 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f
    // doc: https://docs.uniswap.org/protocol/V2/reference/smart-contracts/factory

    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    address private usdt_weth = 0x0d4a11d5EEaaC28EC3F61d100daF4d40471f1852;

    function getReservesTokens() external view returns (uint, uint){
        address pair = IUniswapV2Factory(factory).getPair(usdt, weth);

        (uint reserve0, uint reserve1,) = IUniswapV2Pair(pair).getReserves(); // In the Interface method there are 3 parameters. Add "," as null after that
        return (reserve0, reserve1);
    }
}