//
//  NaviPath.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import Foundation

enum Routes: Hashable{
    case SuperHeroList
    case SuperHeroDetailView(superHeroID: String) //send heroid med
    case SuperHeroSearchView
}

class NaviPath: ObservableObject{
    @Published var routes = [Routes]()
}
