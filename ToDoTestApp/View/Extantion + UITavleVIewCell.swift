//
//  Extantion + UITavleVIewCell.swift
//  ToDoTestApp
//
//  Created by Konstantin on 24.09.2021.
//

import UIKit

extension UITableViewCell {
    func configure(with tasksList: TasksList) {
        let currentTasks = tasksList.tasks.filter("isComplete = false")
        let complitedTasks = tasksList.tasks.filter("isComplete = true")
        
        textLabel?.text = tasksList.name
        
        if !currentTasks.isEmpty {
            detailTextLabel?.text = "\(currentTasks.count)"
        } else if !complitedTasks.isEmpty {
            detailTextLabel?.text = "✅"
        } else {
            detailTextLabel?.text = "0"
        }
    }
}
