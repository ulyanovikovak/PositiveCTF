// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "src/07_Lift/Lift.sol";

// forge test --match-contract LiftTest
contract LiftTest is BaseTest {
    Lift instance;
    bool isTop = true;

    function isTopFloor(uint256) public returns (bool) {
        isTop = !isTop;
        return isTop;
    }

    function setUp() public override {
        super.setUp();

        instance = new Lift();
    }

    function testExploitLevel() public {
        /* YOUR EXPLOIT GOES HERE */

        instance.goToFloor(2);

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(instance.top(), "Solution is not solving the level");
    }
}