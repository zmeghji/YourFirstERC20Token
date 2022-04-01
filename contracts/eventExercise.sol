// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DealerManagement {
    event Provisioned(uint indexed dealerId, string feature);

    // (dealerId => isBlacklisted)
    mapping (uint => bool) blackListedDealers;

    function blacklist(uint dealerId)public {
        blackListedDealers[dealerId] = true;
    }
    
    function provision(uint dealerId, string memory feature) public {
        /**
            Exercise 
                If the dealer is blacklisted, the transaction should revert 
                    with error message "dealer blacklisted"
                If the dealer is not blacklisted, the Provisioned event is emitted with the provided dealerId and feature

                **Hint: Need to use the require keyword. Don't need to use if/else statements.
         */

         require(!blackListedDealers[dealerId], "dealer blacklisted");

         emit Provisioned(dealerId, feature);
    }


}
