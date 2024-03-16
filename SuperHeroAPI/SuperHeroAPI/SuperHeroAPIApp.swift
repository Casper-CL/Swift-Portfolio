//
//  SuperHeroAPIApp.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

@main
struct SuperHeroAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StateController())
                .environmentObject(NaviPath())
        }
    }
}
