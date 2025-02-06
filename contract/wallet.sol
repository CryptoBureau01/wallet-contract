// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract Wallet {
    address public owner;
    mapping(address => uint256) private balances;
    mapping(address => bool) public allowedTokens;
    address[] public allowedTokenList;  // List to store allowed tokens

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // Constructor: Sets the contract owner and allows ETH/BNB/MATIC by default
    constructor() {
        owner = msg.sender;
        allowedTokens[address(0)] = true;  // ETH/BNB/MATIC is allowed by default (native token)
        allowedTokenList.push(address(0)); // Add ETH/BNB/MATIC to allowed tokens list
    }
    
    // Allows owner to add a new token to the allowed list
    function addToken(address token) external onlyOwner {
        require(!allowedTokens[token], "Token already allowed");
        allowedTokens[token] = true;
        allowedTokenList.push(token);  // Add token to allowedTokenList
    }
    
    // Allows owner to remove a token from the allowed list
    function removeToken(address token) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        allowedTokens[token] = false;
        
        // Remove the token from the allowedTokenList
        for (uint256 i = 0; i < allowedTokenList.length; i++) {
            if (allowedTokenList[i] == token) {
                allowedTokenList[i] = allowedTokenList[allowedTokenList.length - 1];
                allowedTokenList.pop();
                break;
            }
        }
    }
    
    // Allows owner to deposit native ETH/BNB/MATIC into the contract (native token)
    function depositNative() external payable onlyOwner {
        balances[owner] += msg.value;
    }
    
    // Allows owner to deposit ERC20 tokens into the contract
    function depositToken(address token, uint256 amount) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[token] += amount;
    }
    
    // Allows owner to withdraw native ETH/BNB/MATIC from the contract (native token)
    function withdrawNative(uint256 amount) external onlyOwner {
        require(balances[owner] >= amount, "Insufficient balance");
        balances[owner] -= amount;
        payable(owner).transfer(amount);
    }
    
    // Allows owner to withdraw ERC20 tokens from the contract
    function withdrawToken(address token, uint256 amount) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        require(balances[token] >= amount, "Insufficient balance");
        balances[token] -= amount;
        require(IERC20(token).transfer(owner, amount), "Transfer failed");
    }

    // Allows owner to check the balance of a specific token in the contract
    function getBalance(address token) external view onlyOwner returns (uint256) {
        return balances[token];
    }

    // Enhanced View Balance: Shows the balance of all allowed tokens including native token
    function viewBalance() external view onlyOwner returns (uint256 nativeBalance, uint256[] memory tokenBalances) {
        nativeBalance = address(this).balance;  // ETH/BNB/MATIC balance

        uint256 tokenCount = allowedTokenList.length;
        tokenBalances = new uint256[](tokenCount);

        for (uint256 i = 0; i < tokenCount; i++) {
            address token = allowedTokenList[i];
            if (token == address(0)) {
                tokenBalances[i] = nativeBalance;  // For native token, use contract's ETH balance
            } else {
                tokenBalances[i] = balances[token];
            }
        }
    }

    // Allows the owner to transfer the ownership to another address
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
    }
}
