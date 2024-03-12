//
//  UserInterests.swift
//  FormDemo
//
//  Created by Casper Lefevre on 28/02/2024.
//

import Foundation


enum UserInterests: String, CaseIterable, Identifiable {
    case Badminton
    case Løb
    case Maling
    case Læsning
    case Tennis
    
    var id: Self {self}
}
