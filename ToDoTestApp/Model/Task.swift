//
//  Task.swift
//  ToDoTestApp
//
//  Created by Konstantin on 23.09.2021.
//

import RealmSwift

class Task: Object {
    
//    @Persisted var name = ""
//    @Persisted var note = ""
//    @Persisted var date = Date()
//    @Persisted var isComplete = false
    
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
    
}


