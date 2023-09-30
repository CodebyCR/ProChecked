//
//  ContentView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 28.04.22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)
    var modelContext: ModelContext
    @Query
    var projects: [Project] = ProjectList.projects
    @State
    var temp: String = ""

    var body: some View {

        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

            NavigationView {

                List {
                    ForEach(projects) { project in

                        NavigationLink(destination:
                                DetailTaskView(project: project), label: {
                                HStack {
                                    ProjectHeadView(project: project)
                                }

                            })

                    }.onDelete(perform: { indexSet in

                        if let index = indexSet.first {
                            // TODO: Fix for swift data
                            // projects.remove(at: index)
                            // modelContext.delete(project)
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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {

    ContentView()
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
        .preferredColorScheme(.dark)
    // use IPhone 15 Pro
    //.previewDevice("IPhone 11")

}
