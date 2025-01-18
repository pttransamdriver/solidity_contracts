// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Arrays in Solidity can be dynamic (variable length) or fixed size
// They can store any data type (uint, string, struct, etc.)
// Arrays are zero-indexed, meaning the first element is at index 0
contract Arrays1 {
    // Dynamic array of uints, initialized with values
    uint[] public array1 = [1, 2, 3];
    
    // Dynamic array of uints, initialized empty but can grow
    uint[] public array2;
    
    // Fixed size array of 10 uints
    // All elements automatically initialized to 0 (default value for uint)
    uint[10] public array3;
    
    // Dynamic array of strings, initialized with values
    // Note: Strings in Solidity are special types of arrays
    string[] public array4  = ["apple", "banana", "carrot"];
    
    // Dynamic array of strings, initialized empty
    string[] public array5;
    
    // Fixed size array of 10 strings
    // All elements automatically initialized to "" (default value for string)
    string[10] public array6;
}


// This contract demonstrates common array operations
// Important: Array operations can be gas-intensive, especially with large arrays
contract Arrays2 {
    // Dynamic array that will store unsigned integers
    uint[] public array;

    // Retrieves element at specified index
    // Will revert if index is out of bounds
    function get(uint i) public view returns (uint) {
        return array[i];
    }

    // Returns entire array
    // 'memory' keyword is required when returning arrays
    function getArray() public view returns (uint[] memory) {
        return array;
    }

    // Returns current length of array
    function length() public view returns (uint) {
        return array.length;
    }

    // Adds new element to end of array
    // This will increase array length by 1
    // Warning: Can be expensive for large arrays due to storage costs
    function push(uint i) public {
        array.push(i);
    }

    // Removes last element from array
    // This will decrease array length by 1
    // Will revert if array is empty
    function pop() public {
        array.pop();
    }

    // Deletes element at given index
    // IMPORTANT: This does not reduce array length
    // It only resets the value at index to 0 (default value)
    // This creates gaps in the array, which might not be desired
    function remove(uint index) public {
        delete array[index];
    }

    // Homework Suggestions:
    // 1. Try implementing a function that removes an element by shifting all elements after it
    // 2. Add a function to insert an element at a specific index
    // 3. Implement a function to check if a value exists in the array
    // 4. Create a function that returns the sum of all elements
}
