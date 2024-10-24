//
//  tmdbApp.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

import SwiftUI

@main
struct tmdbApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
