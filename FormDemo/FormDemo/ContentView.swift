//
//  ContentView.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//
// Cmd a og derefter ctrl I

import SwiftUI

extension Date {
    func formatted(dateFormat: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.string(from: self)
        }
}

struct ContentView: View {
    @State private var showAddForm = false
    @EnvironmentObject var userController: UserController
    @State private var showAlertOnDelete = false
    @State private var deletingUser: User?
    @EnvironmentObject private var navigationPath: NaviPath
    
    
    var body: some View {
        NavigationStack(path: $navigationPath.routes){
            List{
                ForEach($userController.users){$user in
                    Button{
                        navigationPath.routes.append(.userDetail(userID: user.id))
                    }label: {
                        HStack{
                            Text("\(user.firstName) \(user.lastName), \(user.nickName), \(user.birthDate.formatted(dateFormat: "dd-MM-yyyy"))")
                                .foregroundColor(.black)
                                .bold()
                        }
                    
                    }
                    .swipeActions(allowsFullSwipe: true){
                        Button(role: .destructive){
                            showAlertOnDelete = true
                            deletingUser = user
                        }label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                        Button{
                            navigationPath.routes.append(.userDetailEdit(userID: user.id))
                        }label: {
                            Label("Change", systemImage: "square.and.pencil")
                                .tint(.blue)
                        }
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
                case .userDetailEdit(let userID):
                    let user = userController.fetch(withID: userID)
                    if let user {
                        UserDetailEdit(user: user)
                    }
                }
            }
            .navigationTitle("Users")
            
            
            
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
            .sheet(isPresented: $showAddForm){
                MySettings(showAddForm: $showAddForm)
            }
            
            
            .overlay{
                if userController.users.isEmpty {
                    ContentUnavailableView("No users", systemImage: "person.badge.plus", description: Text("You can add a user with the plus button"))
                }
            }
            
            
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


#Preview {
    ContentView()
        .environmentObject(UserController())
        .environmentObject(NaviPath())
}
