// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    uint8 private immutable decimalsValue;

    constructor(string memory name, string memory symbol, uint8 _decimals) ERC20(name, symbol) {
        decimalsValue = _decimals;
    }

    function decimals() public view virtual override returns (uint8) {
        return decimalsValue;
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}