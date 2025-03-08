//
//  InstagramApp.swift
//  Instagram
//
//  Created by mac on 06/03/2025.
//

import SwiftUI
import SwiftData

@main
struct InstagramApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
            FeedView()
        }
        .modelContainer(sharedModelContainer)
    }
}
