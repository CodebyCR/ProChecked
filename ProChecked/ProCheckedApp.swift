//
//  ProCheckedApp.swift
//  ProChecked
//
//  Created by Christoph Rohde on 28.04.22.
//

import SwiftUI

@main
struct ProCheckedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Task.self, Project.self])
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}
