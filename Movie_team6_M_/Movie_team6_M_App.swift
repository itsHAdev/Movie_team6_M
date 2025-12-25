//
//  Movie_team6_M_App.swift
//  Movie_team6_M_
//
//  Created by saja khalid on 04/07/1447 AH.
//

import SwiftUI
import CoreData

@main
struct Movie_team6_M_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
