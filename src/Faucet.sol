// SPDX-License-Identifier: MIT 
pragma solidity 0.8.10;

contract Faucet {

    receive () external payable {}

    function drip () public {
        msg.sender.transfer(1000);
    }
}
