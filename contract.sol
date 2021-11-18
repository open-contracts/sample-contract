// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {

    uint256 _uint;
    bool _bool;
    string _string;
    
    /**
     * @dev Store int value 
     * @param input value to store
     */
    function store_int(uint256 input) public {
        _uint = input;
    }

    /**
     * @dev Store bool value
     * @param input value to store
     */
    function store_bool(bool input) public {
        _bool = input;
    }
    
    function store_string(string memory input) public {
        _string = input;
    }

    function get_int() public view returns(uint256) {
        return _uint;
    }

    function get_bool() public view returns(bool) {
        return _bool;
    }
    
    function get_string() public payable returns(string memory) {
        require(msg.value > 10, "need to pay at least 10 wei");
        return _string;
    }

}
