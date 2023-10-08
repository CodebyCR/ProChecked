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
                .modelContainer(for: [Project.self, Task.self])
        }
    }
}
