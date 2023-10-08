//
//  Task.swift
//  ProChecked
//
//  Created by Christoph Rohde on 01.05.22.
//

import SwiftData
import SwiftUI

@Model
class Task {
    let id = UUID()
    var taskTitle: String
    var taskText: String

    init(taskTitle: String, taskText: String) {
        self.taskTitle = taskTitle
        self.taskText = taskText
    }
}
