// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

import "ds-test/test.sol";
import "src/Crowdfund.sol";

interface CheatCodes {
    function prank(address) external;
}

contract Crowdfund is DSTest {
    CheatCodes cheats = new CheatCodes(HEVM_ADDRESS);
    Crowdfund crowdfund;

    function setUp() public {
        crowdfund = new Crowdfund();
    }

    function testCreateCampaign() public {
        crowdfund.createCampaign();
    }
}
