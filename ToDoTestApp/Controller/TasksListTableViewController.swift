//
//  TasksListTableViewController.swift
//  ToDoTestApp
//
//  Created by Konstantin on 22.09.2021.
//

import UIKit
import RealmSwift

class TasksListTableViewController: UITableViewController {
    
    private var tasksLists: Results<TasksList>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksLists = realm.objects(TasksList.self)
        

    }
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        alertForAddAndUpdateList()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksListCell", for: indexPath)

        let tasksList = tasksLists[indexPath.row]
        cell.textLabel?.text = tasksList.name
        cell.detailTextLabel?.text = "\(tasksList.tasks.count)"

        return cell
    }

}

// MARK: - Alert Add Task

extension TasksListTableViewController {
    
    private func alertForAddAndUpdateList() {
        
        let alert = UIAlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
        var alertTextField: UITextField!
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let text = alertTextField.text, !text.isEmpty else { return }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            alertTextField = textField
            alertTextField.placeholder = "List Name"
        }
        
        present(alert, animated: true)
        
    }
    
}
