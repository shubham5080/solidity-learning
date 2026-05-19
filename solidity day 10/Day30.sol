//SPDX-License-Identifier : MIT
pragma solidity ^0.8.0;
contract Day30 { 
    error NotOwner();
    error InvalidAmount();
    error InsufficientBalance(
        uint available,
        uint needed
    );
    address public owner;
    mapping(address => uint ) balances;
    constructor() {
        owner = msg.sender;
    }
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint amount) external {
        if(msg.sender != owner) {
            revert NotOwner();
        }
        if(amount == 0) {
        revert InvalidAmount();
    }
    if(balances[msg.sender] < amount) {
        revert InsufficientBalance(
            balances[msg.sender],
            amount
        );
    }
    balances[msg.sender] -= amount;
}