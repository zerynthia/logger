// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ILogger.sol";

contract Demo {
    ILogger logger;

    constructor(address _logger) {
        logger = ILogger(_logger);
    }

    function getPayment(address _from, uint _number) public view returns(uint) {
        return logger.getEntry(_from, _number);
    }

    receive() external payable {
        logger.setEntry(msg.sender, msg.value);
    }
}