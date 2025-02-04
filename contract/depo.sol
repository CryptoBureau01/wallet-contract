// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";

contract Depo is Token {
    event DepositedETH(address indexed owner, uint256 amount);
    event DepositedToken(address indexed token, address indexed owner, uint256 amount);

    function depositETH() external payable onlyOwner {
        emit DepositedETH(msg.sender, msg.value);
    }

    function depositToken(address token, uint256 amount) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        require(amount > 0, "Amount must be greater than 0");
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        emit DepositedToken(token, msg.sender, amount);
    }
}
