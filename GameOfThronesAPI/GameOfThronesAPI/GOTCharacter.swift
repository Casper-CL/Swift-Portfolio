//
//  GOTCharacter.swift
//  GameOfThronesAPI
//
//  Created by Casper Lefevre on 08/03/2024.
//

import Foundation

struct GOTCharacter: Decodable,Identifiable, Hashable{
    let id: Int
    let firstName: String
    let lastName: String
    let fullName: String
    let title: String
    let family: String
    let imageUrl: URL
}
