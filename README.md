# ruby-todo-cli
A Todo CLI app written in Ruby

### Rough Idea

A Todo List CLI app that allows users to view, add or remove a particular task from thier todo list. Also allows users mark a particular task as done for the day. All through the CLI app. All task info is stored on a json file. A key-value db implementation.

**User Stories**

1) As a system I want to allow a user create tasks for so as to be able to have a todo list
2) As a system I want to allow a user mark a task as done
3) As a system I want to allow a user view, and delete tasks so as to manage their todo list 

### The Developed Solution

- To run Locally:

_Note: Must have Ruby installed_

**To get the available commands run:**

```> ruby main.rb -h```


![Help command screenshot](https://i.imgur.com/wuzbOYN.png)


**To create a task, run:**

```> ruby main.rb -c "Take my dog on a walk"```


![Create command screenshot](https://i.imgur.com/6wGaZts.png)


**To start a task, run:**

```> ruby main.rb -s 1```


![Start command screenshot](https://i.imgur.com/fORGKKG.png)


**To mark a task as done, run:**

```> ruby main.rb -d 1```


![Done command screenshot](https://i.imgur.com/CtfZbNc.png)


**To remove a task, run:**

```> ruby main.rb -r 1```


![Remove command screenshot](https://i.imgur.com/JT94drA.png)


**To view all tasks, run:**

```> ruby main.rb -v```


![View command screenshot](https://i.imgur.com/YAdby3b.png)
