//
//  AddTaskButtonView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 30.09.23.
//

import SwiftUI

struct AddTaskButton: View {
    @Bindable
    var project: Project

    var body: some View {
        Button(action: {
            let newTask = Task(
                taskTitel: "New super mega Titel ",
                taskText: """
                        new task text mit ganz langer beschreibung,
                        von einen feature um die GUI zu prüfen.
                        """)
            project.tasks.append(newTask)

            print("task count: ", project.tasks.count)

        }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22, alignment: .trailing)
                    .foregroundColor(.black)
                    .padding([.bottom, .trailing], 20)

            })
    }
}

#Preview {
    AddTaskButton(project: ProjectList.projects.first!)
//        .modelContainer(for: [Project.self, Task.self], inMemory: true)
    .preferredColorScheme(.dark)
}

//struct ContentView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        Group {
//            AddTaskButton(project: ProjectList.projects.first!)
//                .previewDevice("IPhone 11")
//            //                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            AddTaskButton(project: ProjectList.projects.first!)
//                .preferredColorScheme(.dark)
//                .previewDevice("IPhone 11")
//        }
//    }
//}
