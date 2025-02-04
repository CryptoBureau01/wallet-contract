// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";

contract List is Token {
    function getTokenList() external view returns (string[] memory) {
        string;
        tokenList[0] = tokenNames[address(0)];  // ETH is default
        return tokenList;
    }
}
