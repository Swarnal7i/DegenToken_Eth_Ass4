// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MySimpleToken is ERC20 {
    address public owner;

    constructor() ERC20("DEGAN", "DGN")  {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "MyToken: caller is not the owner");
        _;
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
}
