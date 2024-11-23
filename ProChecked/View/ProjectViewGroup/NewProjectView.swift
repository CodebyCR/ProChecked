//
//  NewProjectView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 27.01.22.
//

import PhotosUI
import SwiftData
import SwiftUI

struct NewProjectView: View {
    @Environment(\.modelContext)
    var modelContext

    // Project List
    @Query
    private var projects: [Project]

    // Attribute
    @State
    var newTitle: String = ""
    @State
    var newDescription: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    SelectImageView()

                    Section {
                        TextField("Title", text: $newTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)

                        TextField("Description", text: $newDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)

                        // Spacer()
                    }.padding(
                        EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                    )
                    .background(Color.white)
                    .cornerRadius(10)

                    Spacer()
//      List{
//
//            Button("Add Task") {
//                @State var newTask = Task(taskTitel: "New Titel", taskText: "new task text")
//                project.newTasks.append(newTask)
//
//            }.foregroundColor(.black)
//
//
//            ForEach($projects.tasks){ task in
//
//                VStack(alignment: .leading){
//                    Text(task.taskTitel)
//                        .fontWeight(.bold)
//
//                    Text(task.taskText)
//                        .fontWeight(.regular)
//                }
//
//
//            }.onDelete(perform: { indexSet in
//
//                if let i = indexSet.first{
//                    newTasks.remove(at: i)
//                }
//
//            })
//        }//End List
                }
            }
            .foregroundColor(.white)

            // End NavigationView
        }
        .navigationBarItems(trailing:
            Button {
                print("Save tapped")
                let newProject = Project(
                    imageName: "",
                    title: newTitle,
                    description: newDescription,
                    color: ""
                )

                // Füge das neue Projekt hinzu
                modelContext.insert(newProject)
            } label: {
                Text("Done")
                    .foregroundColor(.white)
            }
        )
    }
}

#Preview("New Project View") {
    NewProjectView()
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
}
