// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MagicNum {

  address public solver;

  constructor() public {}

  function setSolver(address _solver) public {
    solver = _solver;
  }

  /*
    ____________/\\\_______/\\\\\\\\\_____        
     __________/\\\\\_____/\\\///////\\\___       
      ________/\\\/\\\____\///______\//\\\__      
       ______/\\\/\/\\\______________/\\\/___     
        ____/\\\/__\/\\\___________/\\\//_____    
         __/\\\\\\\\\\\\\\\\_____/\\\//________   
          _\///////////\\\//____/\\\/___________  
           ___________\/\\\_____/\\\\\\\\\\\\\\\_ 
            ___________\///_____\///////////////__
  */
}

contract ethernautMagicNumber {
  address public solutionAddr;
  address public magicNumContract = 0x200d3d9Ac7bFd556057224e7aEB4161fED5608D0;

  function solve() public {
    address _solutionAddr;
    bytes memory solutionBytecode = getCode();
    assembly {
      _solutionAddr := create(mload(solutionBytecode), add(solutionBytecode,0x20), 0)
      if eq(0, extcodesize(_solutionAddr)) {
        revert(0,0)
      }
    }
    solutionAddr = _solutionAddr;
    MagicNum(magicNumContract).setSolver(solutionAddr);
  }
  
  function getCode() private returns (bytes memory) {
    bytes memory solutionBytecode = hex"600a600c600039600a6000f3602a60005260206000f3";
    return solutionBytecode;
  }
}

//602a60005260206000f3