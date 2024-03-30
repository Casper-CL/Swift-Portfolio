//
//  AvatarView.swift
//  RandomUser
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

struct AvatarView: View {
    let image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(.circle)
            .overlay{
                Circle().stroke(.red, lineWidth: 2)
            }
            .shadow(radius: 7)
            .frame(width: 80, height: 80)
    }
}

