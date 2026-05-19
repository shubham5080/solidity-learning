//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract DayThirteen {
    address public owner;
    bool public paused;
    constructor() {
        owner = msg.sender;
        paused = false;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    modifier notPaused() {
        require(!paused, "Contract paused");
        _;
    }
    modifier validName(string memory _name) {
        require(bytes(_name).length > 0 , "Invalid name");
        _;
    }
    modifier validAge(uint _age) {
        require(_age > 0 && _age < 150, "Invalid age");
        _;
    }
    
}