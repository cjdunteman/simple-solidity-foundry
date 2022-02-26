// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "src/PiggyBank.sol";

interface CheatCodes {
    function prank(address) external;
    function expectRevert(bytes calldata) external;
}

contract PiggyBankTest is DSTest {
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);
    PiggyBank piggy;

    function setUp() public {
        piggy = new PiggyBank();
    }

    function testPlainTransfer () public {
        payable(address(piggy)).transfer(100);
        assertEq(address(piggy).balance, 100);
    }

    function testWithdrawAsOwner () public {
        payable(address(piggy)).transfer(100);

        piggy.withdraw();

        assertEq(address(piggy).balance, 0);
    }
    
    function testWithdrawAsNotOwner() public {
        cheats.expectRevert(
            bytes("only the owner can withdraw")
        );
        cheats.prank(address(0));
        piggy.withdraw();        
    }

    function testWithdrawSelfDestruct () public {
        // TODO:
    }
}
