// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Token {
    mapping(address => bool) public allowedTokens;
    mapping(address => string) public tokenNames;

    event TokenAdded(address indexed token, string tokenName);
    event TokenRemoved(address indexed token);

    constructor() {
        allowedTokens[address(0)] = true;  // ETH is allowed by default
        tokenNames[address(0)] = "ETH";
    }

    function addToken(address token, string memory tokenName) external {
        allowedTokens[token] = true;
        tokenNames[token] = tokenName;
        emit TokenAdded(token, tokenName);
    }

    function removeToken(address token) external {
        allowedTokens[token] = false;
        delete tokenNames[token];
        emit TokenRemoved(token);
    }
}
