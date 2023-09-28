//
//  ContentView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 28.04.22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State var projects: [Project] = ProjectList.projects
    var body: some View {

        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

            NavigationView {

                List {
                    ForEach(projects) { project in

                        NavigationLink(destination: DetailTaskView(project: project), label: {
                                HStack {
                                    ProjectHeadView(project: project)
                                }

                            })

                    }.onDelete(perform: { indexSet in

                        if let index = indexSet.first {
                            projects.remove(at: index)
                        }

                    })

            }.navigationBarItems(
                leading:
                    Text("Projects")
                        .foregroundColor(Color("cold_spring_gray"))
                        .listStyle(GroupedListStyle()),
                    
                trailing:
                    NavigationLink(destination: NewProjectView()) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color("cold_spring_gray"))

            })

        }.accentColor(Color(.white))

    }.ignoresSafeArea(.all)

    }

}

// struct TaskView: View{
//    @ObservedObject var task: Task
//
//    var body: some View {
//
//    }
// }

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        Group {
            ContentView()
                .previewDevice("IPhone 11")
            //                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("IPhone 11")
        }
    }
}
