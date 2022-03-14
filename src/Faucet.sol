// SPDX-License-Identifier: MIT 
pragma solidity 0.8.10;

contract Faucet {

    receive () external payable {}

    function drip (uint256 amount) public {
        require((msg.sender).balance < 10000000000, "you have enough already");
        require((address(this)).balance >= amount, "the faucet does not have enough");

        payable(address(msg.sender)).transfer(amount);
   }
}
