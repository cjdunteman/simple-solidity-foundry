// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "src/Faucet.sol";

interface CheatCodes {
    function prank(address) external;

    function expectRevert(bytes calldata) external;

    function deal(address who, uint256 newBalance) external;
}

contract FaucetTest is DSTest {
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
    Faucet faucet;

    function setUp() public {
        faucet = new Faucet();
    }

    function testDrip() public {
        cheats.deal(address(faucet), 100);
        cheats.prank(address(0));
        faucet.drip(100);
        assertEq(address(0).balance, 100);
    }

    function testDripFaucetBalTooLow() public {
        cheats.expectRevert(bytes("the faucet does not have enough"));
        cheats.prank(address(0));
        faucet.drip(1000);
    }

    function testDripSenderBalTooHigh() public {
        cheats.expectRevert(bytes("you have enough already"));
        cheats.deal(address(0), 10000000001);
        cheats.prank(address(0));
        faucet.drip(1000);
    }
}
