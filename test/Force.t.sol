// SPDX-License-Identifier: Unlicense
pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

import "./utils/BaseTest.sol";
import "src/levels/Force.sol";
import "src/levels/ForceFactory.sol";

contract TestForce is BaseTest {
    Force private level;

    constructor() public {
        // SETUP LEVEL FACTORY
        levelFactory = new ForceFactory();
    }

    function setUp() public override {
        // Call the BaseTest setUp() function that will also create testsing accounts
        super.setUp();
    }

    function testRunLevel() public {
        runLevel();
    }

    function setupLevel() internal override {
        /** CODE YOUR SETUP HERE */

        levelAddress = payable(this.createLevelInstance(true));
        level = Force(levelAddress);

        // Check that the contract is correctly setup
        assertEq(address(level).balance, 0);
    }

    function exploitLevel() internal override {
        vm.startPrank(player, player);

        /** CODE YOUR EXPLOIT HERE */

        // Check we have solved the challenge
        assertEq(address(level).balance, 1);

        vm.stopPrank();
    }
}
