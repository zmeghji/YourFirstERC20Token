// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Ad {
    address public creator;
    uint public price; 


    //runs when the contract is first deployed
    constructor(){
        //creator will be set to the address which deploys the contract
        creator = msg.sender;
    }

    function setPrice(uint newPrice) public{
        /*
            Exercise
                the only address that can set price should be the creator of the ad
                If a different address tries to set the price, the transaction should fail,
                    with the error message "only creator can set price"
                **Hint you will need to use both msg.sender and require
         */
        require(msg.sender== creator, "only creator can set price");
        price = newPrice;
    }
}
