//
//  Task.swift
//  ProChecked
//
//  Created by Christoph Rohde on 01.05.22.
//

import Foundation
import SwiftData

@Model
class Task {
    private(set) var id = UUID()
    var taskTitle: String
    var taskText: String

    init(taskTitle: String, taskText: String) {
        self.taskTitle = taskTitle
        self.taskText = taskText
    }

    public static var container: ModelContainer? = {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try? ModelContainer(for: Task.self, configurations: configuration)
        return container
    }()
}
