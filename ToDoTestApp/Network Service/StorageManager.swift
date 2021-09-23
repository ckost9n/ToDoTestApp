//
//  StorageManager.swift
//  ToDoTestApp
//
//  Created by Konstantin on 23.09.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveTasksList(_ tasksList: [TasksList]) {
        try! realm.write({
            realm.add(tasksList)
        })
    }
    
}