// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

contract Crowdfund {
    struct Campaign {
        uint goalAmount;
        uint pledgeAmount;
        uint startTime;
        uint endTime;
        address owner;
    }

    mapping(address => Campaign) campaigns;

    function createCampaign() public {
        Campaign campaign = new Campaign;
        campaign[owner] = msg.sender;
    }

    function cancelCampaign() public {}

    function pledge(uint amount) public {}

    function unpledge() public {}
}
