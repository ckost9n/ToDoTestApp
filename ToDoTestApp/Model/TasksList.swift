//
//  TasksList.swift
//  ToDoTestApp
//
//  Created by Konstantin on 23.09.2021.
//

import RealmSwift


class TasksList: Object {
    
//    @Persisted var name = ""
//    @Persisted var date = Date()
//    let tasks = List<Task>()
    
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    let tasks = List<Task>()
    
}
