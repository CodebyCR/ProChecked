//
//  ProCheckedApp.swift
//  ProChecked
//
//  Created by Christoph Rohde on 28.04.22.
//

import SwiftUI

@main
struct ProCheckedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
