// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ToDo {
    struct Task {
        uint256 id;
        uint256 date;
        string content;
        string author;
        bool done;
    }

    Task[] public tasks;

    function createTask(string memory _content, string memory _author) public {
        uint256 taskId = tasks.length;
        uint256 taskDate = block.timestamp;
        Task memory newTask = Task(taskId, taskDate, _content, _author, false);
        tasks.push(newTask);
    }

    function getTask(uint256 id) public view returns (uint256, uint256, string memory, string memory, bool) {
        require(id < tasks.length, "Task with this ID does not exist.");
        Task memory task = tasks[id];
        return (task.id, task.date, task.content, task.author, task.done);
    }

    function getTasksCount() public view returns (uint256) {
        return tasks.length;
    }
}
