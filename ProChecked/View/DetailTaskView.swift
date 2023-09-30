//
//  DetailTaskView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 20.01.22.
//

import SwiftUI

struct DetailTaskView: View {
    @Environment(\.modelContext)
    var modelContext
    @Bindable
    var project: Project
    var inLandscape = UIDevice.current.orientation.isLandscape
    let grayGradient = Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")])

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

                ScrollView {
                    ForEach(project.tasks) { task in

                        TaskItemView(task: task)

                    }.onDelete(perform: { indexSet in
                        if let index = indexSet.first {
                            project.tasks.remove(at: index)
                        }
                    })
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
}

#Preview("DetailTaskView") {

    DetailTaskView(project: ProjectList.projects.first!,
                    inLandscape: false)
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
        .preferredColorScheme(.dark)
        // use IPhone 15 Pro
        //.previewDevice("IPhone 11")
        //.previewInterfaceOrientation(.landscapeRight)

}
