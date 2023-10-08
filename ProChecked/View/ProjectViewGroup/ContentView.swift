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
    private var projects: [Project] = ProjectList.projects
    @State
    private var temp: String = ""
    /// **constant**
    private let grayGradient = Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")])

    var body: some View {
        ZStack {
            LinearGradient(gradient: grayGradient,
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
                            print("index: \(index)")
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

#if DEBUG
@available(iOS 17.0, *)
#Preview {
    ContentView()
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
        .preferredColorScheme(.dark)
}
#endif
