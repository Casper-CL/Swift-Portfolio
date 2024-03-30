//
//  UserCellView.swift
//  RandomUser
//
//  Created by Casper Lefevre on 08/03/2024.
//

import SwiftUI

struct UserCellView: View {
    @Binding var user: User
    
    var body: some View {
        HStack{
            AsyncImage(url: user.picture.medium){image in
                AvatarView(image: image)
            }placeholder: {
               ProgressView()
            }
            Text(user.name.first).padding()
        }
    }
}
