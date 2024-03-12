//
//  UserDetailEdit.swift
//  FormDemo
//
//  Created by Casper Lefevre on 01/03/2024.
//

import SwiftUI

struct TextFieldModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(height:40)
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1))
            .padding(EdgeInsets(top: 0, leading: 0.15 * UIScreen.main.bounds.width, bottom: 20, trailing: 0.15 * UIScreen.main.bounds.width))
        
    }
}

struct TextModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 0, leading: 0.15 * UIScreen.main.bounds.width, bottom: 0, trailing: 0.15 * UIScreen.main.bounds.width))
        
    }
}

struct ButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

extension View{
    func TextFieldStyle() -> some View {
        modifier(TextFieldModifier())
    }
    func TextModifierStyle() -> some View {
        modifier(TextModifier())
    }
    func ButtonModifierStyle() -> some View {
        modifier(ButtonModifier())
    }
}

struct UserDetailEdit: View {
    @EnvironmentObject var userController: UserController
    @EnvironmentObject var navigationPath: NaviPath
    @State var user: User
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var nickname = ""
    @State private var birthday = Date()
    
    
    
    var body: some View {
        if let originalUserIndex = userController.users.firstIndex(where: { $0.id == user.id }) {
            
            Text("Update Information")
                .font(.largeTitle.bold())
                .padding()
            
            VStack(alignment: .leading){
                Text("Users firstname")
                    .TextModifierStyle()
                TextField(" \(user.firstName)", text: //$userController.users[originalUserIndex].firstName)
                          $firstName)
                .TextFieldStyle()
                
                Text("Users lastname")
                    .TextModifierStyle()
                TextField(" \(user.lastName)", text:
                            $lastName)
                .TextFieldStyle()
                
                Text("Users nickname")
                    .TextModifierStyle()
                TextField(" \(user.nickName)", text:
                            $nickname)
                .TextFieldStyle()
                
                Text("Users birthday")
                    .TextModifierStyle()
                DatePicker(" \(user.birthDate.formatted(dateFormat: "dd-MM-yyyy"))", selection: $birthday, in: ...Date(), displayedComponents: .date)
                    .TextFieldStyle()
                    .foregroundColor(Color(red: 192/255, green: 192/255, blue: 192/255).opacity(1))
                
                HStack{
                    Button{
                        
                        firstName = ""
                        lastName = ""
                        nickname = ""
                        navigationPath.routes.removeLast()
                        
                    }label: {
                        Text("Cancel")
                    }
                    .ButtonModifierStyle()
                    
                    
                    Button{
                        if firstName.isEmpty {
                            firstName = user.firstName
                        }
                        if lastName.isEmpty {
                            lastName = user.lastName
                        }
                        if nickname.isEmpty {
                            nickname = user.nickName
                        }
                        if birthday == Date(){
                            birthday = user.birthDate
                        }
                        
                        userController.users[originalUserIndex].firstName = $firstName.wrappedValue
                        userController.users[originalUserIndex].lastName = $lastName.wrappedValue
                        userController.users[originalUserIndex].nickName = $nickname.wrappedValue
                        userController.users[originalUserIndex].birthDate = $birthday.wrappedValue
                        
                        navigationPath.routes.removeLast()
                        
                    }label:{
                        Text("Save")
                        
                    }
                    .ButtonModifierStyle()
                }
                .padding()
            }
            Spacer()
        } else {
            Text("No user")
        }
        
    }
}


#Preview {
    UserDetailEdit(user: User(firstName: "", lastName: "", nickName: "", birthDate: Date(), interests: UserInterests.Badminton))
        .environmentObject(UserController())
        .environmentObject(NaviPath())
}
