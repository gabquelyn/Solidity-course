// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract Allowances {
    address payable public owner;
    address public previousOwner;
    struct Detail {
        bool allowed;
        uint appointed;
        bool voted;
    }
   

    mapping(address => Detail) public stakeholders;
    constructor(){
        owner = payable(msg.sender);
    }

    function assignStakeHolder(address _new) public {
        require(msg.sender == owner, "Only contract owner can assign a stakeholder");
        require(stakeholders[_new].appointed == 0, "Already appointed as a stakeolder");
        stakeholders[_new] = Detail(true, block.timestamp, false);
    }
}