// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage {

    /* 
    Variable types & default values:

    uint = 0,
    bool = false,
    string = "",
    address (contract) = 0x0...0,
    bytes / bytes1..bytes32 = 0x0...0
    */

    /*
    Visibility Modifiers:

    private
        - can only be read and write in the contract
        - strictly internal logic/data, no access by child contracts

    internal 
        - read/write in this contract, can not be read or write from outside this contract
        - helper functions or variables for derived contracts

    public (read-only)
        - state variables and functions that need external access

    external 
        - can only read storage, can not write to storage
        - functions intended for external calls (e.g., API methods)

    */

    uint256 public myfavoriteNumber;

    // struct = like a data container
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping (string => uint256) public nameToFavoriteNumber;

    Person public myFriend = Person({favoriteNumber: 7, name: "Matt"});

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }
    
    // view (can read storage), pure (full isolation)
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }

    // calldata (temp const), memory (temp), storage  
    function addPersonToArray(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person({ favoriteNumber: _favoriteNumber ,  name : _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    } 
}