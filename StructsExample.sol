// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Wallet {
    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.value, msg.sender);
    }
}

contract PaymentReceived {
    address public from;
    uint256 public amount;

    constructor(uint256 _amount, address _from) {
        from = _from;
        amount = _amount;
    }
}

contract Wallet2 {
    struct PaymentReceivedStruct {
        address from;
        uint256 amount;
    }

    PaymentReceivedStruct public payment;

    function makePayment() public payable {
        // payment = PaymentReceivedStruct(msg.sender, msg.value);
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}
