//
//  User.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//

import SwiftUI



struct User: Identifiable, Hashable{
    var id = UUID().uuidString
    
    var firstName: String
    var lastName: String
    var nickName: String
    var birthDate: Date
    var interests: UserInterests
}
