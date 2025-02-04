// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./token.sol";
import "@openzeppelin/contracts/access/Ownable.sol";  // Import Ownable contract

contract Depo is Token, Ownable {  // Inherit from Ownable to get the onlyOwner modifier
    event DepositedETH(address indexed owner, uint256 amount);
    event DepositedToken(address indexed token, address indexed owner, uint256 amount);

    // Deposit ETH function with onlyOwner modifier inherited from Ownable
    function depositETH() external payable onlyOwner {
        emit DepositedETH(msg.sender, msg.value);
    }

    // Deposit Token function with onlyOwner modifier inherited from Ownable
    function depositToken(address token, uint256 amount) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        require(amount > 0, "Amount must be greater than 0");
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        emit DepositedToken(token, msg.sender, amount);
    }
}
