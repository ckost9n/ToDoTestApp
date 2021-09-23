//
//  StorageManager.swift
//  ToDoTestApp
//
//  Created by Konstantin on 23.09.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    // MARK: - Tasks Liasts Method
    
    static func saveTasksList(_ tasksList: TasksList) {
        try! realm.write {
            realm.add(tasksList)
        }
    }
    
    static func deleteList(_ tasksList: TasksList) {
        try! realm.write {
            let tasks = tasksList.tasks
            realm.delete(tasks)
            realm.delete(tasksList)
        }
    }
    
    // MARK: - Tasks Method
    
    static func saveTask(_ tasksList: TasksList, task: Task) {
        try! realm.write {
            tasksList.tasks.append(task)
        }
    }
    
}
