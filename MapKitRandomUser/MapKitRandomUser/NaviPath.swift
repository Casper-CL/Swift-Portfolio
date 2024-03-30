//
//  NaviPath.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 28/03/2024.
//

import Foundation


enum Routes : Hashable{
    case ListOfUsers
    case UserDetailView(id: String)
    case AllUserLocations
}

class NaviPath : ObservableObject{
    @Published var routes = [Routes]()
}
