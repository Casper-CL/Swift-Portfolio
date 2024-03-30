//
//  MapKitRandomUserApp.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 15/03/2024.
//

import SwiftUI

@main
struct MapKitRandomUserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StateController())
                .environmentObject(NaviPath())
        }
    }
}
