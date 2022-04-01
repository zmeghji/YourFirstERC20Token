// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Favorite {
    uint public favoriteNumber;

    //view means that the function doesn't change state variables (ie favoriteNumber)
    // returns (uint) means that it returns an integer
    function getFavoriteNumber() public view returns (uint) {
        return favoriteNumber;
    }

    //this function takes a integer parameter and sets it as the new favoriteNumber
    function setFavoriteNumber(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }


    /* Exercise
            We've wrote the functions and state variables necessary for a favorite number.
            Now implement the same for a favorite boolean
            Hint: the type for boolean is bool
    */
    bool public favoriteBool;

    function getFavoriteBool() public view returns (bool){
        return favoriteBool;
    }

    function setFavoriteBool(bool _favoriteBool) public {
        favoriteBool = _favoriteBool;
    }
    
}
