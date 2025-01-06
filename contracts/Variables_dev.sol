// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Variables1 {
    string public name = "Example 1";
}

contract Variable2 {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}