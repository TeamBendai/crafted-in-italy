// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StepsChain {
    struct Step {
        bytes32 previousStep;
        string data;
    }

    mapping(bytes32 => Step) public steps;
    bytes32 public genesisStep;

    // Event to emit when a step is added
    event StepAdded(bytes32 indexed transactionHash, bytes32 previousStep, string data);

    // Constructor to create the first event
    constructor(string memory _data) {
        bytes32 transactionHash = keccak256(abi.encodePacked(msg.sender, _data, block.timestamp));
        genesisStep = transactionHash;
        steps[transactionHash] = Step(0, _data);
        emit StepAdded(transactionHash, 0, _data);
    }

    // Function to add a step to the chain
    function addStep(bytes32 _previousStep, string memory _data) public returns (bytes32) {
        require(_previousStep == 0 || steps[_previousStep].data[0] != 0, "Invalid previous step");
        bytes32 transactionHash = keccak256(abi.encodePacked(msg.sender, _previousStep, _data, block.timestamp));
        steps[transactionHash] = Step(_previousStep, _data);
        emit StepAdded(transactionHash, _previousStep, _data);
        return transactionHash;
    }

    // Function to retrieve the chain of steps for a given transaction
    function getChain(bytes32 _transactionHash) public view returns (Step[] memory) {
        uint256 chainLength = 0;
        bytes32 currentStep = _transactionHash;

        // Determine the length of the chain
        while(currentStep != 0 && steps[currentStep].previousStep != 0) {
            currentStep = steps[currentStep].previousStep;
            chainLength++;
        }

        // Retrieve the chain of steps
        Step[] memory chain = new Step;
        currentStep = _transactionHash;
        for (uint256 i = chainLength; i > 0; i--) {
            Step storage step = steps[currentStep];
            chain[i] = step;
            currentStep = step.previousStep;
        }
        // Add the genesis step at the beginning of the chain
        chain[0] = steps[genesisStep];

        return chain;
    }
}
