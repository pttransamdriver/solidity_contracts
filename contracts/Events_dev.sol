// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// Imports Hardhat's console.log functionality for debugging
import "hardhat/console.sol";

// This contract demonstrates the usage of Events in Solidity
contract Events1 {
    // Public state variable that anyone can read
    // Initial value is set to "Hello World"
    string public message = "Hello World";

    // Defines an event called MessageUpdated that will be emitted when the message is changed
    // Events in Solidity are used to log state changes on the blockchain
    // 'indexed' parameters (like _user) can be efficiently searched for in the blockchain
    // Note: events can have up to 17 arguments
    // You can use any basic data type you want (e.g. string, uint, address, bool, etc...)
    // You can index up to 3 arguments
    event MessageUpdated(
        address indexed _user,    
        string _message          
    );   // The address of the user who updated the message.The new message that was set

    // Public function that allows anyone to update the message
    // 'memory' keyword indicates that _message parameter is temporarily stored in memory
    function updateMessage(string memory _message) public {
        // Updates the state variable with the new message
        message = _message;
        
        // Emits the MessageUpdated event
        // msg.sender is a global variable that contains the address of the account
        // that called this function
        emit MessageUpdated(msg.sender, _message);
    }
}
