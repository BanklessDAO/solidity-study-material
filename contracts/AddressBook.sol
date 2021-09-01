//SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

contract AddressBook {

    //struct for a type of "address" // this allows every user to have their address book//
    struct Record {
        string name;
        address eAddress;
        string note;
    }

    //mapping to link user with their addressbook//
    mapping (address => Record[]) public _aBook;

    //function to add an address//
    function addAddress(string memory _name, address _address,string memory _note) public   {
        Record memory newRecord = Record(_name, _address, _note);
        _aBook[msg.sender].push(newRecord);
    }
    
    //function to get a user's addeess book//
    function getABook() public view returns (Record[] memory){
        return _aBook[msg.sender];
    }

}