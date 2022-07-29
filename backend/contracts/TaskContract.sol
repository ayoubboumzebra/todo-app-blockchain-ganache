// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract TaskContract {
    event AddTask(address recipient, uint256 taskId);
    event DeleteTask(uint256 taskId, bool isDeleted);

    struct Task {
        uint256 id;
        string text;
        bool isDeleted;
    }

    Task[] private tasks;
    mapping(uint256 => address) taskToOwner;

    function addTask(string memory text, bool isDeleted) external {
        uint256 taskId = tasks.length;
        tasks.push(Task(taskId, text, isDeleted));
        taskToOwner[taskId] = msg.sender;
        emit AddTask(msg.sender, taskId);
    }
}
