// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AdManagement {
    event AdRemoved(uint adId);
    event AdCreated(string indexed make, string model, uint year );

    function removeAd(uint adId) public {
        emit AdRemoved(adId);
    }

    function createAd(string memory make, string memory model, uint year) public {
        emit AdCreated(make, model, year);
    }


}
