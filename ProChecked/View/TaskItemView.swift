//
//  TaskItemView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 30.09.23.
//

import SwiftUI

struct TaskItemView: View {
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

                    TextField("Titel", text: $task.taskTitel)
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

#Preview {

    TaskItemView(task: ProjectList.projects.first!.tasks.first!)
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
        .preferredColorScheme(.dark)
        // use IPhone 15 Pro
        //.previewDevice("IPhone 11")
        //.previewInterfaceOrientation(.landscapeRight)
}
