//
//  DawriyahApp.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 05/05/1445 AH.
//

import SwiftUI
import SwiftData

@main
struct DawriyahApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            SplachScreenView()
        }
       // .modelContainer(sharedModelContainer)
    }
}
