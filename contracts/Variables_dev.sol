// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Variables_dev1 {
    string public name = "Example_dev_1";
}

contract Variables_dev2 {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Variables_dev3 {
    string name;

    function setName(string memory _name) public {
        name = _name;
    }
        
    function getName() public view returns(string memory) {
        return name;
    }

}

contract Varables_dev4 {
    string constant NAME = "Example_name_Larry";
    address immutable OWNER;

    constructor() {
        OWNER = msg.sender;
    }

    function name() public pure returns(string memory) {
        return NAME;
    }

    function owner() public view returns(address) {
        return OWNER;
    }

}