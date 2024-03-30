//
//  ContenView.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 15/03/2024.
//

import SwiftUI



struct ContentView: View {
    @EnvironmentObject var stateController: StateController
    @EnvironmentObject var naviPath: NaviPath
    
    var body: some View {
        NavigationStack(path: $naviPath.routes){
            Button{
                naviPath.routes.append(.ListOfUsers)
            }label: {
                Text("All users")
                    .foregroundStyle(.black)
                    .font(.title)
            }
            .padding()
            
            Button{
                naviPath.routes.append(.AllUserLocations)
            }label:{
                Text("Location of all users")
                    .foregroundStyle(.black)
                    .font(.title)
            }
            .padding()
           
            
                .navigationDestination(for: Routes.self){r in
                    switch(r){
                    case .ListOfUsers:
                        ListOfUsersView()
                    case .UserDetailView(let userID):
                        let user = stateController.fetchUser(withID: userID)
                        if let user{
                            UserDetailView(user: user)
                        }
                    case .AllUserLocations:
                        AllUserLocations()
                    }
                }
                .navigationTitle("Random User App")
        }
    }
    
}

#Preview {
    ContentView()
        .environmentObject(StateController())
        .environmentObject(NaviPath())
}
