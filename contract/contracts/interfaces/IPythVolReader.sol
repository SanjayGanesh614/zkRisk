// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IPythVolReader {
    struct PythVolatility {
        int64 vol;
        uint64 conf;
        int32 expo;
        uint timestamp;
    }

    function pythReader() external view returns (address);
    function getRiskMultiplier(bytes32 feedId) external view returns (uint256);
    function getVolatility(bytes32 feedId) external view returns (PythVolatility memory vol, uint256 timestamp);
}