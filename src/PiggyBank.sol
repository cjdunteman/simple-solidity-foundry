// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

contract PiggyBank {
	address owner = msg.sender;

	// Executed on plain Ether transfers
	receive() external payable {}

	function withdraw() public {
		require(msg.sender == owner, "only the owner can withdraw");

		selfdestruct(payable(owner));
	}
}
