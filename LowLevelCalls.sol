// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ContractOne {
    mapping(address => uint) public balance;

    function receiveFunds() public payable {
        balance[msg.sender] += msg.value;
    }

    receive() external payable {
        receiveFunds();
    }
}

contract ContractTwo {
    receive() external payable {}

    function depositOnContractOne(address _contractOne)  public {
        
        // ContractOne one = ContractOne(_contractOne);
        // one.receiveFunds{value: 10, gas: 100000}();
        // bytes memory payload = abi.encodeWithSignature("receiveFunds()");
        // fallback can handle it
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}
