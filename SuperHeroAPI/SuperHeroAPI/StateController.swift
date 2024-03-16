//
//  StateController.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import Foundation

class StateController: ObservableObject{
    @Published var superHeroes: [SuperHero] = []
    
    
    init() {
        //731
        for i in 1...731{
            guard let superHeroURL = URL(string: "https://www.superheroapi.com/api.php/3759601620980605/\(i)") else { return }
            fetchSuperHeroes(from: superHeroURL)
        }
    }
    
    private func fetchSuperHeroes(from url: URL){
        Task(priority: .high){
            guard let rawSuperHeroData = await NetworkService.fetchData(from: url) else { return }
            let decoder = JSONDecoder()
            do{
                let superHeroResult = try decoder.decode(SuperHero.self, from: rawSuperHeroData)
                
                Task{ @MainActor in
                    superHeroes.append(superHeroResult)
                }
            }
        }
    }
    func fetchSuperHero(withID superHeroID: String) -> SuperHero?{
        superHeroes.first{$0.id == superHeroID}
    }   
}
