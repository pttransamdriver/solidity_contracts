// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Read functions are free
// Write functions cost gas

contract Example_Functions {
    string default_name = "Example_Default_name";

    function setName(string memory changed_name) public {
        default_name = changed_name;
    }

    function getName() public view returns(string memory) {
        return default_name;
    }

    function resetName() public {
        default_name = "Example_Default_name";
    }
}

contract Function_Calls_Example {
    uint public count;

    function increment() public {
        count = add(count, 1);
    }

    function add(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }
}