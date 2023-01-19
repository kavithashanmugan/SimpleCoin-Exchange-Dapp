pragma solidity ^0.8.9;

contract TransactionReceipts

{
struct Transaction {
    address sender;
    address receiver;
    uint256 amount;
    uint256 timestamp;
}

mapping (bytes32 => Transaction) public transactions;

function submitTransaction(address _sender, address _receiver, uint256 _amount) public {
    require(msg.sender == _sender);
    bytes32 hash = keccak256(_sender, _receiver, _amount, now);
    transactions[hash] = Transaction(_sender, _receiver, _amount, now);
    emit NewTransaction(hash, _sender, _receiver, _amount, now);
}

}
