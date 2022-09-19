// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

contract ethernaultVault {

    function solve(bytes32 password) external {
        address contractAddr = 0x6E407Af877faaC50001D7b2e1028b1a2e233dd52;
        Vault vault = Vault(contractAddr);
        vault.unlock(password);
    }
}