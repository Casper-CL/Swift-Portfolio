//
//  ContentView.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//
// Cmd a og derefter ctrl I

import SwiftUI

struct ContentViewPast: View {
    @State private var showAddForm = false
    @EnvironmentObject var userController: UserController
    @State private var showAlertOnDelete = false
    @State private var deletingUser: User?
    @EnvironmentObject private var navigationPath: NaviPath
    
    
    var body: some View {
        NavigationStack(path: $navigationPath.routes){
            List{
                ForEach($userController.users, id: \.self){ $user in
                    Button{
                        navigationPath.routes.append(.userDetail(userID: user.id))
                    }label: {
                        VStack(alignment: .leading) {
                            HStack{
                                Text(user.firstName)
                                Text(user.lastName)
                                Text(user.nickName)
                                Text("\(user.birthDate.formatted())")
                            }
                        }
                    }
                    .swipeActions(allowsFullSwipe: true){
                        Button(role: .destructive){
                            showAlertOnDelete = true
                            deletingUser = user
                        }label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                .navigationDestination(for: Routes.self){r in
                    switch (r){
                    case .userDetail(let userID):
                        let user = userController.fetch(withID: userID)
                        if let user {
                            UserDetail(user: user)
                        }
                    default:
                        Text("")
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        showAddForm.toggle()
                    }label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .padding()
                }
            }
            .overlay{
                if userController.users.isEmpty {
                    ContentUnavailableView("Der er ingen users", systemImage: "person.badge.plus", description: Text("Du kan adde users med plus knappen"))
                }
            }
            .navigationTitle("👨‍💻FormDemo")
            .sheet(isPresented: $showAddForm){
                MySettings(showAddForm: $showAddForm)
            }
            
            .alert(isPresented: $showAlertOnDelete){
                Alert(title: Text("Vil du slette?"),
                      message: Text("Vil du slette \(deletingUser?.firstName ?? "Vil du slette useren?")?"),
                      primaryButton: .destructive(Text("Slet"),
                                                  action: {
                    if let deletingUser {
                        userController.delete(deletingUser)
                    }
                    deletingUser = nil}),
                      secondaryButton: .cancel(Text("Annuller"))
                )
            }
        }
    }
}
#Preview {
    ContentView()
        .environmentObject(UserController())
        .environmentObject(NaviPath())
}
