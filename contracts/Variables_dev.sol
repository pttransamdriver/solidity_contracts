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

contract Variables_dev4 {
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

contract Variables_dev5 {
    address public contractAddress;
    address public owner;
    address public payer;
    address public origin;
    uint public amount;

    constructor() {
        contractAddress = address(this);
        owner = msg.sender;
    }

    function pay() public payable {
        amount = msg.value;
        payer = msg.sender;
        origin = tx.origin;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getBlockInfo() public view returns(uint, uint, uint) {
        return (block.number, block.timestamp, block.chainid);
    }
}

contract Variables_dev6 {
    string name1 = "Name 1";
    string private name2 = "Name2";
    string internal name3 = "Name3";
    string public name4 = "Name4";
    
}