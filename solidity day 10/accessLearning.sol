// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.0;
contract AccessLearning {
    address  public owner;
    bool public paused;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }
    function pauseContract() public onlyOwner {
        paused = true;
    }
    function unpauseContract() public onlyOwner {
        paused = false;
    }
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0) , "Invalid address" );
        owner = newOwner;
         }
}