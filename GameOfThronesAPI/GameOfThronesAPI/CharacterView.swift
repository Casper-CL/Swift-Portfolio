//
//  CharacterView.swift
//  GameOfThronesAPI
//
//  Created by Casper Lefevre on 12/03/2024.
//

import SwiftUI

struct CharacterView: View {
    @Binding var character: GOTCharacter
    
    var body: some View {
        VStack{
            AsyncImage(url: character.imageUrl){image in
                AvatarView(image: image)
            }placeholder: {
               ProgressView()
            }
            Text(character.title).padding()
            Text(character.fullName).padding()
            Text(character.family).padding()
        }
    }
}
