//
//  FormDemoApp.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//

import SwiftUI

@main
struct FormDemoApp: App {
    @State private var userController = UserController()
    @State private var navigationPath = NaviPath()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userController)
                .environmentObject(navigationPath)
        }
    }
}
