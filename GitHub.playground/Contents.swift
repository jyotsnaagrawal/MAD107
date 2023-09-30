import UIKit

// Define an array to store tasks
var tasks: [String] = []

// Function to add a task to the task list
func addTask(_ task: String) {
    tasks.append(task) // Add the task to the 'tasks' array
}

// Closure to list all tasks
let listTasks: () -> Void = {
    print("Tasks:") // Print a header for the tasks
    for (index, task) in tasks.enumerated() {
        print("\(index + 1). \(task)") // Print each task with an index
    }
}

// Add tasks using the function
addTask("Buy groceries") // Call the 'addTask' function to add a task
addTask("Finish work report") // Call the 'addTask' function to add another task

// List tasks using the closure
listTasks() // Call the 'listTasks' closure to print all tasks
