//
//  StateController.swift
//  RandomUser
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

class StateController: ObservableObject{
    @Published var users: [User] = []
    
    
    init() {
        guard let userURL = URL(string: "https://randomuser.me/api/?nat=DK&results=50") else { return }
        fetchUsers(from: userURL)
    }
    
    private func fetchUsers(from url: URL){
        Task(priority: .background){
            guard let rawUserData = await NetworkService.fetchData(from: url) else { return }
            let decoder = JSONDecoder()
            do{
                let userResult = try decoder.decode(RandomUserResult.self, from: rawUserData)
                Task{ @MainActor in
                    users = userResult.results
                }
            }
        }
    }
    
    func fetchUser(withID id: String) -> User?{
        users.first{id == $0.id}
    }
}
