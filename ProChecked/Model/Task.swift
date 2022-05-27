//
//  Task.swift
//  ProChecked
//
//  Created by Christoph Rohde on 01.05.22.
//

import SwiftUI

class Task: ObservableObject, Identifiable{
    let id = UUID()
    var taskTitel: String
    var taskText: String
    
    init(taskTitel: String, taskText: String) {
        self.taskTitel = taskTitel
        self.taskText = taskText
    }
}


