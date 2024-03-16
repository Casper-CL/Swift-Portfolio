//
//  SuperHeroSearchView.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

struct SuperHeroSearchView: View {
    @EnvironmentObject var navigationPath: NaviPath
    @EnvironmentObject var stateController: StateController
    
    @State private var searchString = ""
    
    var body: some View {
        List{
            ForEach(searchResult){superHero in
                Button{
                    navigationPath.routes.append(.SuperHeroDetailView(superHeroID: superHero.id))
                }label: {
                    SuperHeroSearchCellView(superHero: superHero)
                        .foregroundColor(.black)
                }
            }
        }
        .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a SuperHero")
        .autocorrectionDisabled()
        .navigationTitle("Search & Learn")
    }
    var searchResult: [SuperHero]{
        if(searchString.isEmpty){
            return stateController.superHeroes.sorted{$0.name < $1.name}
        }
        else {
            return stateController.superHeroes.filter{$0.name.contains(searchString)}.sorted{$0.name < $1.name}
        }
        
    }
}

#Preview {
    SuperHeroSearchView()
        .environmentObject(NaviPath())
        .environmentObject(StateController())
}
