pragma solidity ^0.5.16;

import "./PriceOracle.sol";
import "./CErc20.sol";

contract SimplePriceOracle is PriceOracle {
    mapping(address => uint) prices;
    bool public constant isPriceOracle = true;
    event PricePosted(address asset, uint previousPriceMantissa, uint requestedPriceMantissa, uint newPriceMantissa);


    function getUnderlyingPrice(CToken cToken) public view returns (uint) {
        // return prices[address(CErc20(address(cToken)).underlying())];
        if(prices[address(cToken)] == 0) return 1e18;
        return prices[address(cToken)];
    }

    function setUnderlyingPrice(CToken cToken, uint underlyingPriceMantissa) public {
        // address asset = address(CErc20(address(cToken)).underlying());
        emit PricePosted(address(cToken), prices[address(cToken)], underlyingPriceMantissa, underlyingPriceMantissa);
        // prices[asset] = underlyingPriceMantissa;
        prices[address(cToken)] = underlyingPriceMantissa;
    }

    // function setDirectPrice(address asset, uint price) public {
    //     emit PricePosted(asset, prices[asset], price, price);
    //     prices[asset] = price;
    // }

    // v1 price oracle interface for use as backing of proxy
    // function assetPrices(address asset) external view returns (uint) {
    //     return prices[asset];
    // }
}
