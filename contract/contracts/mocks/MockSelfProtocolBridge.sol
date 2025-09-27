// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockSelfProtocolBridge {
    address private owner;
    mapping(address => bool) private verifiedUsers;

    constructor(address _owner) {
        owner = _owner;
    }

    function setVerified(address user, bool status) external {
        require(msg.sender == owner, "Not authorized");
        verifiedUsers[user] = status;
    }

    function isVerified(address user) external view returns (bool) {
        return verifiedUsers[user];
    }

    function verifyIdentity(bytes32 messageHash, bytes calldata hyperlaneSignature) external pure returns (bool) {
        // Mock implementation - always returns true in test
        return true;
    }
}