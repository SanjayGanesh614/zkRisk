// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MockPyth {
    mapping(bytes32 => int64) private prices;
    mapping(bytes32 => uint) private confidences;
    mapping(bytes32 => uint) private timestamps;

    constructor() {}

    function updatePriceFeeds(bytes32[] memory ids, int64[] memory _prices, uint[] memory _confidences) external {
        require(ids.length == _prices.length && ids.length == _confidences.length, "Array lengths must match");
        for (uint i = 0; i < ids.length; i++) {
            prices[ids[i]] = _prices[i];
            confidences[ids[i]] = _confidences[i];
            timestamps[ids[i]] = block.timestamp;
        }
    }

    function getPriceUnsafe(bytes32 id) external view returns (int64, uint, uint) {
        return (prices[id], confidences[id], timestamps[id]);
    }

    function getPrice(bytes32 id) external view returns (int64, uint, uint) {
        return (prices[id], confidences[id], timestamps[id]);
    }

    function getAddress() external view returns (address) {
        return address(this);
    }
}