// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
contract SmartMoneyExample{
    //defaults to uint256
    uint public amountReceived;
    function receiveEth() public payable {
        amountReceived += msg.value;
    }

    //returns contracts balance
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    //withdraw to the callers address
    function withDrawAll() public {
        address payable reciever = payable(msg.sender);
        reciever.transfer(getBalance());
    }

    function withDrawTo(address payable reciever) public{
        reciever.transfer(getBalance());
    }
} 