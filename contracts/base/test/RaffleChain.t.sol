// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/RaffleChain.sol";

contract RaffleChainTest is Test {
    RaffleChain public c;
    
    function setUp() public {
        c = new RaffleChain();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
