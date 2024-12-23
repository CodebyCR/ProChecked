//
//  DetailTaskView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 20.01.22.
//

import SwiftData
import SwiftUI

struct DetailTaskView: View {
    @Environment(\.modelContext)
    private var modelContext: ModelContext
    @Bindable
    var project: Project
    private let inLandscape = UIDevice.current.orientation.isLandscape
    private let grayGradient = Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")])

    var body: some View {
        //        NavigationView{
        ZStack {
            LinearGradient(gradient: grayGradient,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                VStack {
                    if inLandscape {
                        HStack(spacing: 10) {
                            HStack {
                                ProjectHeadView(project: project)
                            }.padding()
                        }
                    } else {
                        HStack {
                            HStack {
                                ProjectHeadView(project: project)
                            }.padding(10)
                        }
                    }

                    HStack {
                        Spacer()
                        AddTaskButton(project: project)
                    }
                }

                //                Spacer()

                if project.tasks.isEmpty {
                    Spacer()
                }

                NavigationView {
                    ScrollView {
                        ForEach(project.tasks) { task in

                            TaskItemView(task: task)

                        }.onDelete(perform: deleteTask)
                    }
                }

//                func deleteTask(indexSet: IndexSet){
//                    //indexSet.forEach(task.
//                    for index in indexSet {
//                        let task = project.tasks.remove (at:index)
//                        modelContext.delete(car)
//                    }
//                }
            }
        }
    }

    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let taskToRemove = project.tasks.remove(at: index)
            modelContext.delete(taskToRemove)
        }
    }
}

// #if DEBUG
// @available(iOS 17.0, *)
// #Preview("Detail Task View") {
//    var previewProject: Project = ProjectList.projects.first!
//    return DetailTaskView(project: previewProject)
////        .modelContainer(for: [Project.self, Task.self], inMemory: true)
// }
// #endif
