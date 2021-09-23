//
//  TasksTableViewController.swift
//  ToDoTestApp
//
//  Created by Konstantin on 22.09.2021.
//

import UIKit
import RealmSwift

class TasksTableViewController: UITableViewController {
    
    var currentTasksList: TasksList!
    
    var currentTasks: Results<Task>!
    var completedTasks: Results<Task>!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentTasksList.name
        filteringTasks()
        
    }
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        alertForAddAndUpdateList()
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? currentTasks.count : completedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Current Tasks" : "Completed Tasks"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath)

        var task: Task!
        task = indexPath.section == 0 ? currentTasks[indexPath.row] : completedTasks[indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.note

        return cell
    }
    
    private func filteringTasks() {
        currentTasks = currentTasksList.tasks.filter("isComplete = false")
        completedTasks = currentTasksList.tasks.filter("isComplete = true")
        tableView.reloadData()
    }

}

extension TasksTableViewController {
    
    func alertForAddAndUpdateList() {
        
        let alert = UIAlertController(title: "New Task", message: "Please insert task value", preferredStyle: .alert)
        var taskTextfield: UITextField!
        var noteTextField: UITextField!
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let text = taskTextfield.text, !text.isEmpty else { return }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            taskTextfield = textField
            taskTextfield.placeholder = "New Task"
        }
        
        alert.addTextField { textField in
            noteTextField = textField
            noteTextField.placeholder = "Note"
        }
        
        present(alert, animated: true)
        
    }
    
}
