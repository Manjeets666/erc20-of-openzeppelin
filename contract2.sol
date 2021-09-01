// SPDX-License-Identifier: MIT
//token with a fixed supply of 100, initially allocated to the account that deploys the contract.
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ERC20FixedSupply is ERC20 {
    constructor() ERC20("Fixed", "FIX") {
        _mint(msg.sender, 100);
    }
}
