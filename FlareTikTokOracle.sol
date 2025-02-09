contract FlareTikTokOracle {
    address public owner;
    IFlareOracle public flareOracle;

    constructor(address _flareOracle) {
        owner = msg.sender;
        flareOracle = IFlareOracle(_flareOracle);
    }

    function fetchLatestTikTokData() public view returns (uint256, uint256) {
        uint256 timestamp = block.timestamp - (block.timestamp % 86400); // Daily timestamp
        return flareOracle.getTikTokData(timestamp);
    }
}
