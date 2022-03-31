// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract LastSender {
    address public lastSender;

    //runs when the contract is first deployed
    constructor(){
        //lastSender will initially be set to the address which deploys the contract
        lastSender = msg.sender;
    }

    function sendMessage() public{
        lastSender = msg.sender;
    }
}
