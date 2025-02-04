// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";

contract With is Token {
    event WithdrawnETH(address indexed owner, uint256 amount);
    event WithdrawnToken(address indexed token, address indexed owner, uint256 amount);

    function withdrawETH(uint256 amount) external onlyOwner {
        require(address(this).balance >= amount, "Insufficient contract balance");
        payable(msg.sender).transfer(amount);
        emit WithdrawnETH(msg.sender, amount);
    }

    function withdrawToken(address token, uint256 amount) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        require(IERC20(token).balanceOf(address(this)) >= amount, "Insufficient balance");
        require(IERC20(token).transfer(msg.sender, amount), "Transfer failed");
        emit WithdrawnToken(token, msg.sender, amount);
    }
}
