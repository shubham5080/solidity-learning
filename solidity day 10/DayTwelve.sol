//SPDX-License-Identifier : MIT
pragma solidity ^0.8.0;
 contract DayTwelve {
    address public owner;
    bool public paused;
  mapping(address => string) public users;
  mapping(address => bool) public registered;
  constructor () {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Not Owner");
    _;
  }
  modifier notPaused() {
    require(!paused, "Contract paused");
    _;
  }
  modifier validName(string memory _name) {
    require(bytes(_name).length > 0, "Invalid name");
    _;
  }
  modifier onlyNewUser() {
    require(!registered[msg.sender], "Already registered");
    _;
  }
  function pause() public onlyOwner {
    paused = true;
  }
  function unpause() public onlyOwner {
    paused = false;
  }
  function register(string memory _name) public notPaused validName(_name) {
    users[msg.sender] = _name;
    registered[msg.sender] = true;
  }
 }