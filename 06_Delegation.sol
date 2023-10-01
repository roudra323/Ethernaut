// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}
/* 

 In the provided smart contract,
the owner of the Delegate contract can be changed by calling the pwn function
through the Delegation contract.
This means that anyone who interacts with the
Delegation contract and knows how to trigger the pwn function
can become the new owner of the Delegate contract, effectively changing control over it.

*/
