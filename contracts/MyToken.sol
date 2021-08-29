//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20 {

    bool public mintable;
    bool public pausable;

    uint256 public initialSupply = 1000;
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        mintable = true;
        pausable = true;
    }

}