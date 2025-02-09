// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IFlareOracle {
    function getNfndexplorerData(uint256 timestamp) external view returns (uint256 spend, uint256 clicks);
}

contract NfndexplorerDataStorage {
    address public owner;
    mapping(uint256 => uint256) public spendData;
    mapping(uint256 => uint256) public clickData;

    event NfndexplorerDataUpdated(uint256 timestamp, uint256 spend, uint256 clicks);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function updateNfndexplorerData(uint256 timestamp, uint256 spend, uint256 clicks) external onlyOwner {
        spendData[timestamp] = spend;
        clickData[timestamp] = clicks;
        emit NfndexplorerDataUpdated(timestamp, spend, clicks);
    }

    function getNfndexplorerMetrics(uint256 timestamp) public view returns (uint256, uint256) {
        return (spendData[timestamp], clickData[timestamp]);
    }
}
