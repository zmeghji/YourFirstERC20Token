// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Jar {
    uint public beans;

    //runs when the contract is first deployed
    constructor(){
        beans = 250;
    }

    function take100Beans() public{
        //if there are less than a hundred beans the whole transaction reverts.
        require(beans >= 100, "Not enough beans");
        beans = beans -100;
    }
}
