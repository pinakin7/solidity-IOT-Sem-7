// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract transferFunds {

   function getBalance(address _sender) public view returns(uint){
            return _sender.balance;
        }

    function sendEth(address payable _to) public payable returns(bytes memory) {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Transaction failed");
        return data;
    }

}
