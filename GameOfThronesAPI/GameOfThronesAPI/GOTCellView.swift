//
//  GOTCellView.swift
//  GameOfThronesAPI
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

struct GOTCellView: View {
    @Binding var character: GOTCharacter
    
    var body: some View {
        HStack{
            AsyncImage(url: character.imageUrl){image in
                AvatarView(image: image)
            }placeholder: {
               ProgressView()
            }
            Text(character.fullName).padding()
        }
    }
}

