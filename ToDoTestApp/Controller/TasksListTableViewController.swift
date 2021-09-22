//
//  TasksListTableViewController.swift
//  ToDoTestApp
//
//  Created by Konstantin on 22.09.2021.
//

import UIKit

class TasksListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        alertForAddAndUpdateList()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksListCell", for: indexPath)

        // Configure the cell...

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
