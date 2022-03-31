// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Dealers {
    // (DealerId => Inventory Count)
    mapping (uint => uint) public dealerInventoryCount  ;

    //Retrieves inventory count for dealer with id of dealerId 
    function getDealerInventoryCount(uint dealerId ) public view returns(uint){
        return dealerInventoryCount[dealerId];
    }

    //Set inventory count for dealer with id of dealerId 
    function setDealerInventoryCount(uint dealerId, uint inventoryCount ) public {
        dealerInventoryCount[dealerId] = inventoryCount;
    }
    
    /*
        Exercise
            Create a function (transferInventory) which transfers inventory from one dealer to another
            The function takes three parameters:
                - fromDealerId
                - toDealerId
                - amountToTransfer
            Don't worry about validation for now 

     */
}
