// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract MappingStructExample{
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numberOfDeposits;
        mapping(uint => Transaction) deposits;
        uint numberOfWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;
    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numberOfDeposits] = deposit;
        balances[msg.sender].numberOfDeposits++;

    }
    //getter functions for mappings in structs

    function getDeposits(address from, uint index) public view returns(Transaction memory){
        return balances[from].deposits[index];
    }
    function getWithdrawlas(uint index) public view returns(Transaction memory) {
        return balances[msg.sender].withdrawals[index];
    }



    function withdrawlAllMoney() public payable {
        uint allBalance = balances[msg.sender].totalBalance;
        balances[msg.sender].totalBalance = 0;
        payable (msg.sender).transfer(allBalance);
        Transaction memory withdrawal = Transaction(allBalance, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numberOfWithdrawals] = withdrawal;
        balances[msg.sender].numberOfWithdrawals++;
    }

    function withDrawMoney(address payable receiver, uint amount) public {
        balances[msg.sender].totalBalance -= amount;
        Transaction memory withdrawal = Transaction(amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numberOfWithdrawals] = withdrawal;
        balances[msg.sender].numberOfWithdrawals++;
        receiver.transfer(amount);
    }
}