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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let currentList = tasksLists[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            StorageManager.deleteList(currentList)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = .red
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {_,_,_ in
            self.alertForAddAndUpdateList()
        }
        
        let deleteSwipeAction = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return deleteSwipeAction
    }
    
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let taskList = tasksLists[indexPath.row]
            let tasksVC = segue.destination as! TasksTableViewController
            tasksVC.currentTasksList = taskList
        }
    }
    
}

// MARK: - Alert Add Task

extension TasksListTableViewController {
    
    private func alertForAddAndUpdateList(_ listName: TasksList? = nil) {
        
//        var title = "New List"
//        var doneButton = "Save"
        
        let alert = UIAlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
        var alertTextField: UITextField!
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newList = alertTextField.text, !newList.isEmpty else { return }
            
            let tasksList = TasksList()
            tasksList.name = newList
            
            StorageManager.saveTasksList(tasksList)
            self.tableView.insertRows(at: [IndexPath (
                row: self.tasksLists.count - 1, section: 0)], with: .automatic
            )
            
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
