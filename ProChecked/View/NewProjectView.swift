//
//  NewProjectView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 27.01.22.
//

import SwiftUI

struct NewProjectView: View {
    @Environment(\.modelContext)
    var modelContext

    // Project List
    @State
    var projects: [Project] = ProjectList.projects

    // Attribute
    @State
    var newTitle: String = ""
    @State
    var newDescription: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    ZStack {
                        Color(.black)
                            .frame(width: 100, height: 100, alignment: .top)
                            .opacity(0.6)
                            //                            .mask(Capsule(style: .circular))
                            .clipShape(Circle())

                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .frame(width: 100, height: 100)
                            .mask(Capsule(style: .continuous))
                    }

                    VStack(spacing: 20) {
                        TextField("Titel", text: $newTitle)
                            //                            .fontWeight(.bold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .padding(.vertical, 1)

                        //                        laufweite

                        TextField("Project description here...", text: $newDescription)
                            //                            .fontWeight(.light)
                            .foregroundColor(Color("rich_ground"))
                            .lineLimit(5)
                            .padding()
                            .frame(width: 200, height: 30, alignment: .center)
                            .foregroundColor(.white)

                    }.padding(80)

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
            }.foregroundColor(.white)

            // End NavigationView

        }.navigationBarItems(trailing:
            Button(action: {
                print("Save tapped")
                let newProject = Project(
                    imageName: "",
                    title: newTitle,
                    description: newDescription,
                    color: "")

                // Füge das neue Projekt hinzu
                modelContext.insert(newProject)
            }) {
                Text("Done")
                    .foregroundColor(.white)

            })
    }
}

#Preview {
    NewProjectView()
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
}

// struct NewContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NewProjectView()
//                .previewDevice("IPhone 11")
//
//            NewProjectView()
//                .previewDevice("IPhone 11")
//                .preferredColorScheme(.dark)
//        }
//    }
// }
