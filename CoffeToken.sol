// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract CoffeeToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    event CoffeePurchased(address indexed  receiver, address indexed buyer);
    constructor() ERC20("CoffeeToken", "CFC") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function buyOneCoffe () public {
        _burn(_msgSender(), 1);
        emit CoffeePurchased(_msgSender(), _msgSender());
    }

    function BuyCoffeeFrom(address account) public {
        _spendAllowance(account, _msgSender(), 1);
        emit CoffeePurchased(_msgSender(), account);
    }
}
