//
//  NavigationPath.swift
//  FormDemo
//
//  Created by Casper Lefevre on 01/03/2024.
//

import Foundation


enum Routes: Hashable{
    case userDetail(userID: String)
    case userDetailEdit(userID: String)
    
}

class NaviPath: ObservableObject{
    @Published var routes = [Routes]()
    
}
