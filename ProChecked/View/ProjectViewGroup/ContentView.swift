//
//  ContentView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 28.04.22.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext)
    private var modelContext: ModelContext
    @Query
    var projects: [Project] // = ProjectList.projects

    @State
    private var temp: String = ""
    /// **constant**
    private let grayGradient = Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")])

    private func deleteProject(indexSet: IndexSet) {
        indexSet
            .map { projects[$0] }
            .forEach { modelContext.delete($0) }
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: grayGradient,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

            NavigationStack {
                List {
                    ForEach(projects) { project in

                        NavigationLink(destination:
                            DetailTaskView(project: project), label: {
                                HStack {
                                    ProjectHeadView(project: project)
                                }

                            })

                    }.onDelete(perform: deleteProject)

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
            }
            .accentColor(Color(.white))

        }.ignoresSafeArea(.all)
    }
}

#if DEBUG
@available(iOS 17.0, *)
#Preview {
    ContentView()
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
        .preferredColorScheme(.dark)
}
#endif
