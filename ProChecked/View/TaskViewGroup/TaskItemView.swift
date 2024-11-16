//
//  TaskItemView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 30.09.23.
//

import SwiftUI

struct TaskItemView: View {
//    @Environment(\.modelContext)
//    private var modelContext: ModelContext
    @State
    var task: Task

    var body: some View {
        ZStack {
            Color(.white)
                .opacity(0.5)
                .cornerRadius(10)
                .padding(.horizontal, 10)

            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    TextField("Title", text: $task.taskTitle)
                        .multilineTextAlignment(.leading)

                    // For taskText
                    ZStack {
                        TextEditor(text: $task.taskText)

                        Text(task.taskText)
                            .opacity(0)
                            .padding(.all, 8)
                    }
                }
                .padding(.horizontal, 12.0)
                .padding(.vertical, 10.0)
            }
        }
    }
}

//#if DEBUG
//@available(iOS 17.0, *)
//#Preview {
//    var previewTask: Task = ProjectList.projects.first!.tasks.first!
//    return TaskItemView(task: previewTask)
////        .modelContainer(for: [Project.self, Task.self], inMemory: true)
////        .preferredColorScheme(.dark)
////        .previewInterfaceOrientation(.landscapeRight)
//}
//#endif
