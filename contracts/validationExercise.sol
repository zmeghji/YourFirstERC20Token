// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Car {
    uint public year;

    

    function setYear(uint _year) public{
        /*
            Exercise
                If the provided _year is not between 1885 - 2022,
                then fail with the error message "year not in range (1885-2022)
            Hint: the "and" operator is &&
        */ 
        year = _year;
    }
}
