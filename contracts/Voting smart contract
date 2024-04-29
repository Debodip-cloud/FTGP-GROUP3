//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Voting {
    // Structure to represent a candidate
    struct Candidate {
        string name;        // Name of the candidate
        uint256 voteCount;  // Number of accumulated votes for the candidate
    }

    // Array to store all the candidates
    Candidate[] public  candidates;

    // Mapping to track whether an address has voted or not
    mapping(address => bool) public  voters;

    // Address of the contract owner
    address public owner;

    // Event emitted when a vote is cast
    event Voted(address indexed voter, uint256 candidateIndex);

    // Event emitted when a new candidate is added
    event CandidateAdded(string name);

    // Contract constructor, sets the owner to the deployer of the contract
    constructor() {
        owner = msg.sender;
    }

    // Function to allow the owner to add a new candidate
    function addCandidate(string memory _name) public  {
        // Adds a new candidate with the specified name to the candidates array
        candidates.push(Candidate(_name, 0));
        // Emits an event to notify that a new candidate has been added
        emit CandidateAdded(_name);
    }

    // Function to allow a voter to cast a vote for a candidate
    function vote(uint256 _candidateIndex) external {
        // Checks if the sender has not voted before
        // Checks  the dictionary voters if the address(msg.sender) is present or not 
        require(!voters[msg.sender], "You already voted");
        // Checks if the candidate index is valid
        require(_candidateIndex < candidates.length, "Invalid candidate");
        
        // Marks the sender as voted
        voters[msg.sender] = true;
        // Increments the vote count for the selected candidate
        candidates[_candidateIndex].voteCount++;
        
        // Emits an event to indicate that a vote has been cast
        emit Voted(msg.sender, _candidateIndex);
    }

    // Function to determine the winning candidate
    function winningCandidate() public view returns (string memory _winner) {
        uint256 winningVotes = 0;
        // Loops through all candidates to find the one with the highest vote count
        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVotes) {
                winningVotes = candidates[i].voteCount;
                _winner = candidates[i].name;
            }
        }
    }

    // Function to check if a voter has already voted
    function hasVoted() external view returns (bool) {
        return voters[msg.sender];
    }

    // Function to get the total number of candidates
    function getCandidateCount() external view returns (uint256) {
        return candidates.length;
    }

}
