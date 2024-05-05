// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StepsChainV3 {
    struct Step {
        string producerName;
        string producerStepName;
        uint256 startTime;
        uint256 endTime;
        string description;
        string additionalData;
        string hiddenData;
        bytes32[] parentTransactions;
    }

    mapping(bytes32 => Step) public steps;
    bytes32 public genesisStepHash;

    // Event to emit when a step is added
    event StepAdded(bytes32 indexed transactionHash, string producerName, string producerStepName, uint256 startTime, uint256 endTime, string description, string additionalData, string hiddenData);

    // Constructor to create the first event
    constructor(string memory _producerName, string memory _producerStepName, uint256 _startTime, uint256 _endTime, string memory _description, string memory _additionalData, string memory _hiddenData) {
        genesisStepHash = keccak256(abi.encodePacked(_producerName, _producerStepName, _startTime, _endTime, _description, _additionalData, _hiddenData, block.timestamp));
        steps[genesisStepHash] = Step(_producerName, _producerStepName, _startTime, _endTime, _description, _additionalData, _hiddenData, new bytes32);
        emit StepAdded(genesisStepHash, _producerName, _producerStepName, _startTime, _endTime, _description, _additionalData, _hiddenData);
    }

    // Function to add a step to the chain
    function addStep(string memory _producerName, string memory _producerStepName, uint256 _startTime, uint256 _endTime, string memory _description, string memory _additionalData, string memory _hiddenData, bytes32[] memory _parentTransactions) public returns (bytes32) {
        bytes32 transactionHash = keccak256(abi.encodePacked(_producerName, _producerStepName, _startTime, _endTime, _description, _additionalData, _hiddenData, block.timestamp));
        steps[transactionHash] = Step(_producerName, _producerStepName, _startTime, _endTime, _description, _additionalData, _hiddenData, _parentTransactions);
        emit StepAdded(transactionHash, _producerName, _producerStepName, _startTime, _endTime, _description, _additionalData, _hiddenData);
        return transactionHash;
    }

    // Function to retrieve the chain of steps for a given transaction
    function getChain(bytes32 _transactionHash) public view returns (Step[] memory) {
        uint256 chainLength = 0;
        bytes32 currentStep = _transactionHash;

        // Determine the length of the chain
        while(currentStep != 0 && steps[currentStep].parentTransactions.length > 0) {
            currentStep = steps[currentStep].parentTransactions[0]; // Assuming the first parent is the direct previous step
            chainLength++;
        }

        // Retrieve the chain of steps
        Step[] memory chain = new Step;
        currentStep = _transactionHash;
        for (uint256 i = chainLength; i > 0; i--) {
            Step storage step = steps[currentStep];
            chain[i] = step;
            if(step.parentTransactions.length > 0) {
                currentStep = step.parentTransactions[0]; // Assuming the first parent is the direct previous step
            }
        }
        // Add the genesis step at the beginning of the chain
        chain[0] = steps[genesisStepHash];

        return chain;
    }
}
