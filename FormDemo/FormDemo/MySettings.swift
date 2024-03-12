//
//  MySettings.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//

import SwiftUI


struct MySettings: View {
    @Binding var showAddForm: Bool
    @EnvironmentObject var userController: UserController
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var nickName = ""
    @State private var birthDate = Date()
    @State private var userInterests = UserInterests.Læsning
    
    var body: some View{
        Form{
            Section("user details"){
                TextField("Firstname", text: $firstName)
                TextField("Lastname", text: $lastName)
                TextField("Nickname", text: $nickName)
            }
            Section("personal info"){
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date){
                    Text("Select your birthdate")
                }
                Picker("What are your interests?", selection: $userInterests){
                    ForEach(UserInterests.allCases){ interest in
                        Text(interest.rawValue).tag(interest)
                    }
                }
            }
            
            Button{
                let user = User(firstName: firstName, lastName: lastName, nickName: nickName, birthDate: birthDate, interests: userInterests)
                userController.addUser(user)
                showAddForm.toggle()
            }label:{
                Text("Create")
            }
        }
    }
}


#Preview {
    MySettings(showAddForm: .constant(true))
}
