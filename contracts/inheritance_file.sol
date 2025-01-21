// Base contract with core functionality
// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Animal {
    // Internal state that derived contracts can access
    string internal name;
    uint internal age;
    
    // Virtual keyword allows function to be overridden
    function makeSound() public virtual pure returns (string memory) {
        return "...";
    }
    
    // Non-virtual function cannot be overridden
    function getType() public pure returns (string memory) {
        return "Animal";
    }
    
    // Internal function that children can access and override
    function getDetails() internal virtual view returns (string memory) {
        return string(abi.encodePacked("Name: ", name, ", Age: ", age));
    }
}

// Direct inheritance
contract Dog is Animal {
    // Override keyword required when overriding a virtual function
    function makeSound() public virtual override pure returns (string memory) {
        return "Woof!";
    }
    
    // Add new functionality
    function fetch() public pure returns (string memory) {
        return "Fetching ball...";
    }
}

// Multiple inheritance example
contract Guard {
    bool internal isOnDuty;
    
    function guard() public virtual pure returns (string memory) {
        return "Guarding...";
    }
    
    modifier onlyOnDuty() {
        require(isOnDuty, "Not on duty");
        _;
    }
}

// Contract inheriting from multiple parents
contract GuardDog is Dog, Guard {
    // Must override function that exists in multiple parents
    function makeSound() public override(Dog) pure returns (string memory) {
        return "WOOF! WOOF!";
    }
    
    // Can combine functionality from both parents
    function guardAndBark() public view onlyOnDuty returns (string memory) {
        return string(abi.encodePacked(guard(), " ", makeSound()));
    }
}

// Demonstrating constructor inheritance
contract Living {
    uint public creationTime;
    
    // Base constructor
    constructor() {
        creationTime = block.timestamp;
    }
}

contract Plant is Living {
    string public species;
    
    // Must call parent constructor
    constructor(string memory _species) Living() {
        species = _species;
    }
}

// Abstract contracts can have unimplemented functions
abstract contract Vehicle {
    function getSpeed() public virtual returns (uint);
    
    // Can have implemented functions too
    function isMoving() public virtual returns (bool) {
        return getSpeed() > 0;
    }
}

// Must implement all abstract functions
contract Car is Vehicle {
    uint private speed;
    
    function getSpeed() public override view returns (uint) {
        return speed;
    }
}

// Interfaces - can only have unimplemented functions
interface IVehicle {
    function getSpeed() external returns (uint);
    function setSpeed(uint _speed) external;
}

// Diamond inheritance example
contract A {
    function foo() public virtual pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public virtual override pure returns (string memory) {
        return "B";
    }
}

contract C is A {
    function foo() public virtual override pure returns (string memory) {
        return "C";
    }
}

// Must specify all contracts being overridden
contract D is B, C {
    function foo() public override(B, C) pure returns (string memory) {
        // Can call parent implementations
        return string(abi.encodePacked(B.foo(), C.foo()));
    }
}