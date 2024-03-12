//
//  ContentView.swift
//  GameOfThronesAPI
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var stateController: StateController
    
    var body: some View {
        NavigationStack{
            
            List($stateController.gotCharacters){ $character in
                NavigationLink(destination: CharacterView(character: $character)) {
                    GOTCellView(character: $character)
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("GOT Characters")
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(StateController())
}

