//
//  FoodyApp.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//

import SwiftUI

@main
struct FoodyApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
