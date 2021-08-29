//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol';
import '@openzeppelin/contracts/access/AccessControl.sol';

contract MyToken is ERC20, ERC20Burnable, AccessControl {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    uint256 public initialSupply = 1000;

    bool public mintable;
    bool public pausable;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        mintable = true;
        pausable = true;
        _mint(msg.sender, initialSupply);
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        require(mintable, "MyToken is no longer mintable");
        _mint(to, amount);
    }

    

    // function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20, ERC20Pausable) {
    //     super._beforeTokenTransfer(from, to, amount);
    // }

}