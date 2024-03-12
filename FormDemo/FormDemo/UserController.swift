//
//  UserController.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//

import Foundation

class UserController: ObservableObject {
    @Published var users = [User]()
    
    func addUser(_ user: User){
        users.append(user)
    }
    
    func delete(_ user: User){
        users.removeAll{ $0.id == user.id }
    }
    
    func fetch(withID userID: String) -> User?{
        users.first{$0.id == userID}
    }
}
