pragma solidity ^0.8.0;

contract CoinExchange {
    SimpleCoin public token;

    constructor(address _tokenAddress) public {
        token = MyToken(_tokenAddress);
    }

    function checkBalance(address _user) public view returns (uint256) {
        return token.balanceOf[_user];
    }

    function transfer(address _to, uint256 _value) public {
        require(token.balanceOf[msg.sender] >= _value && _value > 0);
        token.transfer(_to, _value);
    }
}
