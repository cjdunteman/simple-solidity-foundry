// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "src/Faucet.sol";

interface CheatCodes {
    function prank(address) external; 
    function expectRevert(bytes calldata) external;
}

contract FaucetTest is DSTest {
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
    Faucet faucet;

    function setUp() public {
        faucet = new Faucet();
    }

    function testDripFaucetBalTooLow () public {
        payable(address(faucet)).transfer(1001);
        cheats.prank(address(0));
        faucet.drip(1000);
        cheats.expectRevert(
            bytes("the faucet does not have enough")
        );
    }
}
