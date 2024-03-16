//
//  SuperHeroList.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

struct SuperHeroList: View {
    @EnvironmentObject var stateController: StateController
    @EnvironmentObject var navigationPath: NaviPath
    var body: some View {
       
        
        List($stateController.superHeroes){$superhero in
            Button{
                navigationPath.routes.append(.SuperHeroDetailView(superHeroID: superhero.id))
            }label:{
                SuperHeroCellView(superHero: $superhero)
                    .foregroundColor(.black)
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle("All SuperHeroes")
         
          
    }
    
}

#Preview {
    SuperHeroList()
        .environmentObject(StateController())
        .environmentObject(NaviPath())
}
