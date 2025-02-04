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
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }
    
    // Constructor: Sets the contract owner and allows initial tokens
    constructor(address[] memory _tokens) {
        owner = msg.sender;
        for (uint i = 0; i < _tokens.length; i++) {
            allowedTokens[_tokens[i]] = true;
        }
    }
    
    // Allows owner to add a new token to the allowed list
    function addToken(address token) external onlyOwner {
        allowedTokens[token] = true;
    }
    
    // Allows owner to remove a token from the allowed list
    function removeToken(address token) external onlyOwner {
        allowedTokens[token] = false;
    }
    
    // Allows owner to deposit native ETH into the contract
    function depositETH() external payable onlyOwner {
        balances[owner] += msg.value;
    }
    
    // Allows owner to deposit ERC20 tokens into the contract
    function depositToken(address token, uint256 amount) external onlyOwner {
        require(allowedTokens[token], "Token not allowed");
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[token] += amount;
    }
    
    // Allows owner to withdraw native ETH from the contract
    function withdrawETH(uint256 amount) external onlyOwner {
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
}
