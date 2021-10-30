pragma solidity ^0.8.0;
import "https://github.com/open-contracts/protocol/blob/main/solidity_contracts/OpenContractRopsten.sol";

contract Graffiti is OpenContractAlpha {

    string public publicWall;
    string public oracleWall;

    function sprayAsOracle (bytes32 oracleHash, address msgSender, string memory someString)
    public _oracle(oracleHash, msgSender, this.sprayAsOracle.selector) {
        oracleWall = someString;
    }
    
    function spray(string memory someString) public {
        publicWall = someString;
    }

}
