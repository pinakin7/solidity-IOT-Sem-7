// Q1. Design a smart contract for energy trading and transaction between seller and buyer. Next, deploy the contract using Remix IDE .

pragma solidity >= 0.8.0;

contract EnergyTrade{
    uint16 unitRateTransfer = 10000;

    mapping(address => uint) private totEnergyUnit;
    address[] private users;

    function getEnergyUnit(address _user) public view returns(uint){
        return totEnergyUnit[_user];
    }

    function setEnergyUnit(address _user, uint _energyUnit) payable public returns(uint){
        uint userBalance = totEnergyUnit[_user];
        totEnergyUnit[_user] = _energyUnit+userBalance;
        return totEnergyUnit[_user];
    }

    function transferEnergy(address _sender, address payable _to, uint energyUnit) public payable returns(bytes memory) {
        uint totAmount = unitRateTransfer * energyUnit;

        uint senderBalance = totEnergyUnit[_sender];
        uint recieverBalance = totEnergyUnit[_to];

        require(senderBalance>energyUnit, "Invalid Transaction");

        (bool sent, bytes memory data) = _to.call{value: totAmount}("");
        require(sent, "Transaction failed");

        totEnergyUnit[_to] = recieverBalance+energyUnit;
        totEnergyUnit[_sender] = senderBalance-energyUnit;

        return "Transaction Successfull";
    }

}
