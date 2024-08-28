//
//  DailyGrind69_1App.swift
//  DailyGrind69.1
//
//  Created by Joseph DeWeese on 8/28/24.
//

import SwiftUI
import SwiftData

@main
struct DailyGrind69_1App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Task.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TaskListScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
