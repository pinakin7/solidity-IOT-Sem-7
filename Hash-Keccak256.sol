// Q1. Design a smart contract using a solidity language on the Remix IDE platform for Hashing with Keccak256.

// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.0;

contract hashData{
    function getHash(string memory _data) public pure returns(bytes32){
        return keccak256(abi.encode(_data));
    }
}
