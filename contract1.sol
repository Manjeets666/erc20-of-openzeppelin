// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//used inheritence here.
contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MT") {
        _mint(msg.sender, initialSupply);
   
    }
    //updating the decimal value.
     function decimals() public view virtual override returns (uint8) {
        return 18;
        }
}
