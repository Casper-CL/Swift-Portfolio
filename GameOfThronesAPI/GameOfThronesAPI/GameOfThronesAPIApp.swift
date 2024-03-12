//
//  GameOfThronesAPIApp.swift
//  GameOfThronesAPI
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

@main
struct GameOfThronesAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(StateController())
        }
    }
}
