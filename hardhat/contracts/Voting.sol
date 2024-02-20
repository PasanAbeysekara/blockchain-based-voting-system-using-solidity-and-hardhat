// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Voting {
    // Structure template for each candidate
    struct Candidate {
        uint256 id;
        string name;
        uint256 numberOfVotes;
    }

    // Array of all candidates
    Candidate[] public candidates;
    // Owner's address
    address public owner;
    // Mapping of voter's addresses to their voting status
    mapping(address => bool) public voters;
    // Array to keep track of voters
    address[] public listOfVoters;

    // Variables to track voting start and end times
    uint256 public votingStart;
    uint256 public votingEnd;
    // Flag to indicate if the election has started
    bool public electionStarted;

    // Modifier to restrict certain actions to the contract's owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not authorized to start an election");
        _;
    }

    // Modifier to check if an election is currently ongoing
    modifier electionOnGoing() {
        require(electionStarted, "No election yet");
        _;
    }

    // Constructor to set the contract's owner upon deployment
    constructor() {
        owner = msg.sender;
    }

    // Function to start an election
    function startElection(string[] memory _candidates, uint256 _votingDuration) public onlyOwner {
        require(!electionStarted, "Election is currently ongoing");
        delete candidates; // Clear current candidates
        resetAllVoterStatus(); // Reset the status of all voters

        // Add new candidates
        for (uint256 i = 0; i < _candidates.length; i++) {
            candidates.push(Candidate({id: i, name: _candidates[i], numberOfVotes: 0}));
        }
        electionStarted = true;
        votingStart = block.timestamp; // Record start time
        votingEnd = block.timestamp + (_votingDuration * 1 minutes); // Set end time
    }

    // Function to add a new candidate during the election
    function addCandidate(string memory _name) public onlyOwner electionOnGoing {
        require(checkElectionPeriod(), "Election period has ended");
        candidates.push(Candidate({id: candidates.length, name: _name, numberOfVotes: 0}));
    }

    // Function to check a voter's status
    function voterStatus(address _voter) public view electionOnGoing returns (bool) {
        return voters[_voter];
    }

    // Function to allow voting
    function vote(uint256 _id) public electionOnGoing {
        require(checkElectionPeriod(), "Election Period has ended");
        require(!voterStatus(msg.sender), "You already voted. You can only vote once");
        candidates[_id].numberOfVotes++; // Increment vote count
        voters[msg.sender] = true; // Mark voter as having voted
        listOfVoters.push(msg.sender); // Add voter to the list
    }

    // Function to retrieve the list of candidates and their vote counts
    function retrieveVotes() public view returns (Candidate[] memory) {
        return candidates;
    }

    // Function to check how much time is left in the election
    function electionTimer() public view electionOnGoing returns (uint256) {
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return (votingEnd - block.timestamp);
    }

    // Function to check if the election period is still ongoing
    function checkElectionPeriod() public returns (bool) {
        if (electionTimer() > 0) {
            return true;
        }
        electionStarted = false; // Automatically end the election if time's up
        return false;
    }

    // Internal function to reset all voter statuses
    function resetAllVoterStatus() private {
        for (uint256 i = 0; i < listOfVoters.length; i++) {
            voters[listOfVoters[i]] = false;
        }
        delete listOfVoters; // Clear the list of voters
    }
}
