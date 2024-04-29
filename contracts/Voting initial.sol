
//SPDX-License-Identifier:MIT


pragma solidity ^0.8.0;

contract Voting {
    // Structure to represent a candidate
    struct Candidate {
        uint256 voteCount; // Number of accumulated votes for the candidate
    }

    // Array to store all the candidates
    Candidate[] public candidates;

    // Mapping to track whether an address has voted or not
    // dictionary of key value pair, key as address and value as bool(voter or not)
    mapping(address => bool) public voters;

    // Event to emit when a vote is cast
    event Voted(address indexed voter, uint256 candidateIndex);

    // Constructor to initialize the contract with a specified number of candidates
    constructor(uint256 _numCandidates) {
        // Loop to create the specified number of candidates
        for (uint256 i = 0; i < _numCandidates; i++) {
            candidates.push(); // Adds a new candidate to the candidates array
        }
    }

    // Function to allow a voter to cast a vote for a candidate
    function vote(uint256 _candidateIndex) external {
        // Check if the sender has not voted before
        // Checks  the dictionary voters if the address(msg.sender) is present or not 
        require(!voters[msg.sender], "You have already voted");
        // Check if the candidate index is valid
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        // Mark the sender as voted
        voters[msg.sender] = true;
        // Increment the vote count for the selected candidate
        candidates[_candidateIndex].voteCount++;

        // Emit the Voted event
        emit Voted(msg.sender, _candidateIndex);
    }

    // Function to determine the winning candidate index
    function winningCandidate() public view returns (uint256 _winningCandidate) {
        // Variable to store the highest number of votes
        uint256 winningVoteCount = 0;
        // Loop through all candidates to find the candidate with the highest vote count
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                // Update the winningVoteCount and winningCandidate index
                winningVoteCount = candidates[i].voteCount;
                _winningCandidate = i;
            }
        }
    }
}
