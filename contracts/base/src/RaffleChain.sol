// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title RaffleChain Contract
/// @notice Provably fair on-chain raffle system.
contract RaffleChain {

    address[] public players;
    uint256 public entryFee = 0.01 ether;
    address public winner;
    
    function enter() external payable {
        require(msg.value == entryFee, "Incorrect fee");
        players.push(msg.sender);
    }
    
    function pickWinner() external {
        require(players.length > 0, "No players");
        // Pseudo-random for demo
        uint256 index = uint256(keccak256(abi.encodePacked(block.timestamp, players.length))) % players.length;
        winner = players[index];
        payable(winner).transfer(address(this).balance);
        delete players;
    }

}
