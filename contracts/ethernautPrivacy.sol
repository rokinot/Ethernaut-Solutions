// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Privacy {

  bool public locked = true;
  uint256 public ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(block.timestamp);
  bytes32[3] private data;

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}

contract ethernautPrivacy {
    function solve() external {
        Privacy priv = Privacy(0x28e67a98D0c8024ea7b6E32372660a818Dc235f8);
        bytes32[3] memory solution;
        solution[0] = 0x5d9e27bb101563603d8433b5a171522d812ada1ad676036669609408c5197dd5;
        solution[1] = 0x068e67054fec579d6a5ff6001c63bfac4360020cf795bae96756449d5bdc950e;
        solution[2] = 0xfbef1ce7a4dd3e0a39a3c3e7c7c3f5609452e8b2a3f14521c5a24b7e6a035f52;
        priv.unlock(bytes16(solution[2]));
    }
}