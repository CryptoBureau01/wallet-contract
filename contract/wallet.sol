// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";
import "./deposit.sol";
import "./withdraw.sol";
import "./list.sol";

contract Wallet is Token, Depo, With, List {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        // ETH is allowed by default, it will be in Token.sol
    }

    function BalanceList() external view onlyOwner returns (string[] memory) {
        return getTokenList();  // From List.sol, fetch all token names
    }
}
