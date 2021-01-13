pragma solidity ^0.5.16;

// import "./Exponential.sol";
// import "./CToken.sol";

interface V1PriceOracleInterface {
    function assetPrices(address asset) external view returns (uint);
}

// contract OracleStorage {
//   /// @notice symbol -> price,
//   constructor() public {
        
//     }
//   mapping(bytes32 => uint) public mapPrices;
//   function getValue(bytes32 key) external view returns (uint);
// }

contract StoremanOracleImplement {

    address public owner;
    address public stormanOracle;
    // mapping(address => bytes32) public _assetPrices;

    // constructor(address _stormanOracle) public {
    //     owner = msg.sender;
    //     stormanOracle = _stormanOracle;
    // }

    // function() payable external {
    //     revert();
    // }


    // function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
    //     assembly {
    //       result := mload(add(source, 32))
    //     }
    // }
    /**
      * @notice retrieves price of an asset
      * @dev function to get price for an asset
      * @param asset Asset for which to get the price
      * @return uint mantissa of asset price (scaled by 1e18) or zero if unset or contract paused
      */
    // function assetPrices(address asset) public view returns (uint) {

    //     string memory symbol;
    //     return 1;

    //     // CToken ct = CToken(asset);
    //     // if(keccak256(abi.encodePacked(ct.name)) == keccak256("CWan")) return 1;//symbol = "WAN";
    //     // else{
    //     //     // CErc20Storage cerc20 = CErc20Storage(asset);
    //     //     // EIP20Interface erc20 = EIP20Interface(cerc20.underlying());
    //     //     // symbol = erc20.symbol();
    //     //     symbol = "ETH";
    //     // }


    //     // bytes32 key = stringToBytes32(symbol);
    //     // bytes32 wanKey = stringToBytes32("WAN");
        
    //     // OracleStorage oracleStorage = OracleStorage(stormanOracle);
    //     // uint readValue = oracleStorage.getValue(key);
    //     // uint readValueWan = oracleStorage.getValue(wanKey);
    //     // (MathError error, Exp memory invertedVal) = getExp(readValue, uint256(readValueWan));

    //     // if (error != MathError.NO_ERROR) {return 0;}

    //     // return invertedVal.mantissa;
    // }

}
