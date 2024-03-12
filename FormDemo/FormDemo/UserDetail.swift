//
//  UserDetail.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//

import SwiftUI

struct TextModifierDetail : ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 0, leading: -0.35 * UIScreen.main.bounds.width, bottom: 0, trailing: 0.15 * UIScreen.main.bounds.width))
    }
}

extension View {
    func TextModifierDetailStyle() -> some View {
        modifier(TextModifierDetail())
    }
}

struct UserDetail: View {
    @EnvironmentObject var navigationPath: NaviPath
    @EnvironmentObject var userController: UserController
    
    var user: User?
    
    
    var body: some View {
        Text("\(user?.firstName ?? "unknown") \(user?.lastName ?? "unknown")")
            .font(.largeTitle.bold())
            .padding(EdgeInsets(top: 5, leading: 0.15 * UIScreen.main.bounds.width, bottom: 20, trailing: 0.15 * UIScreen.main.bounds.width))
        
        VStack(alignment: .leading){
            
            Text("AKA")
                .TextModifierDetailStyle()
                .font(.system(size: 25).bold())
                
            Text(user?.nickName ?? "unknown")
                .TextModifierDetailStyle()
                .padding(.bottom, 10)
            
            Text("Birthday")
                .TextModifierDetailStyle()
                .font(.system(size: 25).bold())
            Text(user?.birthDate.formatted(dateFormat: "dd-MM-yyyy") ?? "unknown")
                .TextModifierDetailStyle()
        }
        
        
        HStack{
            Spacer()
            Button("Delete"){
                if let realUser = user {
                    userController.delete(realUser)
                    navigationPath.routes.removeLast()
                }
            }
            Spacer()
            Button("Update"){
                if let currentUser = user{
                    navigationPath.routes.append(Routes.userDetailEdit(userID: currentUser.id))
                }
            }
            Spacer()
        }
        .padding()
        Spacer()
        Spacer()
        
    }
}

#Preview {
    UserDetail()
        .environmentObject(UserController())
        .environmentObject(NaviPath())
}
