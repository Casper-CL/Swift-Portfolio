//
//  ContentView.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var stateController: StateController
    @EnvironmentObject var navigationPath: NaviPath
    
    var body: some View {
        NavigationStack(path: $navigationPath.routes){
            Image("superheroes")
                .resizable()
                .scaledToFit()
            Spacer()
            HStack {
                Text("This is an API for displaying all SuperHeroes with their information. Search for you favorite SuperHero or discover the ones, you do not know about")
                    .padding()
            }
            Spacer()
            VStack{
                Button{
                    navigationPath.routes.append(.SuperHeroList)
                }label: {
                    Text("All SuperHeroes")
                }
                .padding()
                
                Button{
                    navigationPath.routes.append(.SuperHeroSearchView)
                }label: {
                    Text("Search for a SuperHero")
                }
                .padding()

                
                Spacer()
                Image(systemName: "figure.archery")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Spacer()
                
            }
            .navigationDestination(for: Routes.self){r in
                switch(r){
                case .SuperHeroList:
                    SuperHeroList()
                    
                case .SuperHeroDetailView(let superHeroID):
                    let superhero = stateController.fetchSuperHero(withID: superHeroID)
                    if let superhero{
                        SuperHeroDetailView(superHero: superhero)
                    }
                case .SuperHeroSearchView:
                    SuperHeroSearchView()
                }
                
            }
            
            .navigationTitle("SuperHero API")
        }
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(NaviPath())
        .environmentObject(StateController())
}
