// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ExampleMappings {
    mapping(uint256 => bool) public myMapping;
    mapping(address => bool) public myAdressMapping;
    // For mapping of mappings
    mapping(uint256 => mapping(uint256 => bool)) public uintUintBoolMapping;

    function setValue(uint256 _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAdressMapping[msg.sender] = true;
    }

    function setUintUintBoolapping( uint _key1, uint _key2, bool _value) public{
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}
