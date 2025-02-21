// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contracts Arrays1 {
    uint[] public array1 = [1, 2, 3]; //Unbound array initialized with integers
    uint[] public array2; // Unbound array with no initial integers
    uint[10] public array3; // Bound to 10 item array
    uint[] public array4 = ["Apple","Banana","Orange"]; // Unbound array inialized with 3 strings
    string[] public array5; // Unbound array of strings done the proper way
    string[10] public array6; // Bound array of strings. Limit 10 strings
}

contract Arrays2 {
    uint[] public array; // Unbound array of unsigned integers

    function getArray() public 
}