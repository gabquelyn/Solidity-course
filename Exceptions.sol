// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract willErrorOut {
    error NotAllowedError(string);
    function tryOut() public pure {
        // require(false, "Something went wrong"); caught by Error
        // assert(false); caught by Panic
        revert NotAllowedError("Hey, not allowed");
    }
}


contract willDoSomething {
    event ErrorLogging(string reason);
    event ErrorCodeLogging(uint code);
    event ErrorLogBytes(bytes error);
    function catchTheError() public{
        willErrorOut will = new willErrorOut();
        try will.tryOut() {
            // do something after successfully trying it;
        }catch Error(string memory reason){
            emit ErrorLogging(reason);
        } catch Panic(uint code){
            emit ErrorCodeLogging(code);
        }catch(bytes memory lowLevelData){
            emit ErrorLogBytes(lowLevelData);
        }
    }
}