pragma solidity ^0.8.0;
import "https://github.com/open-contracts/protocol/blob/main/solidity_contracts/OpenContractAlpha.sol";

contract ExampleContract is OpenContractAlpha {
    
    string public stringStorage;
    
    constructor() OpenContractAlpha(0xcD74359aDE16d5aAba79b05bc5750c5817993feA) {
        
    }
    
    function saveFromEnclaveOnly (bytes32 oracleHash, address msgSender, string memory someString)
    public onlyOracle(oracleHash, 0x78ec6a41af8657793af05c1b88226a934f56e10ef3fefac944849cd7226baea1) {
        stringStorage = someString;
    }
    
}
