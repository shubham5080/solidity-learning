//SPDX-License Identifier: MIT
pragma solidity ^0.8.0;
contract DayEleven  {
    address public owner;
    bool public paused;
    uint public age;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    modifier notPaused() {
        require(!paused, "Contract paused");
        _;
    }
    modifier validAge(uint _age) {
        require(_age > 0 && _age < 150, "Invalid age");
        _;
    }
    function pause() public onlyOwner {
        paused = true;
    }
    function unpause() public onlyOwner {
        paused = false;
    }
    function updateAge(uint _age) public onlyOwner notPaused validAge(_age) {
        age = _age;
    }
}