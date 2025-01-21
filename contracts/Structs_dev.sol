// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// This contract demonstrates different ways to work with Structs in Solidity
contract Structs1 {
    // Define a struct called Book with three properties
    // Structs allow you to create your own custom data type
    struct Book {
        string title;    // Store the book's title
        string author;   // Store the book's author
        bool completed;  // Track if the book has been read/completed
    }

    // Create a dynamic array to store Book structs
    // 'public' allows other contracts to read this array
    Book[] public books;

    // First method to add a book: Direct struct creation in push method
    function add1(string memory _title, string memory _author) public {
        books.push(Book(_title, _author, false));
        // Note: Parameters passed in order they appear in struct
    }

    // Second method to add a book: Named parameters
    // This method is more explicit and less prone to errors
    function add2(string memory _title, string memory _author) public {
        books.push(Book({
            title: _title,
            author: _author,
            completed: false
        }));
    }

    // Third method to add a book: Create struct in memory first
    // This method allows for more complex initialization if needed
    function add3(string memory _title, string memory _author) public {
        Book memory book;  // Declare a temporary Book struct in memory
        book.title = _title;
        book.author = _author;
        // completed is automatically set to false (default value for bool)

        books.push(book);
    }

    // Retrieve a book's details by its index in the array
    // 'view' keyword indicates this function doesn't modify state
    function get(uint _index)
        public
        view
        returns (string memory title, string memory author, bool completed)
    {
        Book storage book = books[_index];  // Get reference to book in storage
        return (book.title, book.author, book.completed);
    }

    // Mark a book as completed using its index
    function complete(uint _index) public {
        // 'storage' keyword creates a reference to the actual storage location
        Book storage book = books[_index];
        book.completed = true;  // This modifies the actual book in storage
    }
}
