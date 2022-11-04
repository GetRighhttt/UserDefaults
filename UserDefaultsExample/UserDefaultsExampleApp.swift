//
//  UserDefaultsExampleApp.swift
//  UserDefaultsExample
//
//  Created by Stefan Bayne on 11/4/22.
//

import SwiftUI

@main
struct UserDefaultsExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
