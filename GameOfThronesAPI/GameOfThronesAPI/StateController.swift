//
//  StateController.swift
//  GameOfThronesAPI
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

class StateController: ObservableObject{
    @Published var gotCharacters: [GOTCharacter] = []
    
    
    init() {
        guard let gotURL = URL(string: "https://thronesapi.com/api/v2/Characters") else { return }
        fetchGOTCharacters(from: gotURL)
    }
    
    private func fetchGOTCharacters(from url: URL){
        Task(priority: .high){
            guard let rawGOTData = await NetworkService.fetchData(from: url) else { return }
            print(rawGOTData)
            let decoder = JSONDecoder()
            do{
                let gotResult = try decoder.decode([GOTCharacter].self, from: rawGOTData)
                Task{ @MainActor in
                    gotCharacters = gotResult
                }
            }
        }
    }
}
