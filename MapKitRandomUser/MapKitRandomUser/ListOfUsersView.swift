//
//  ListOfUsersView.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 19/03/2024.
//

import SwiftUI

struct ListOfUsersView: View {
    @EnvironmentObject var stateController: StateController
    @EnvironmentObject var naviPath: NaviPath
    
    var body: some View {
        
        List($stateController.users){$user in
            Button{
                naviPath.routes.append(.UserDetailView(id: $user.id))
            }label:{
                UserCellView(user: $user)
            }
            .foregroundStyle(.black)
            .listRowSeparator(.hidden)
            
            .navigationTitle("\(stateController.users.count) Random Users")
        }
        
    }
}

#Preview {
    ListOfUsersView()
        .environmentObject(StateController())
        .environmentObject(NaviPath())
}
