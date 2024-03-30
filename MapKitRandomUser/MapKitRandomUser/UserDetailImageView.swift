//
//  UserDetailImageView.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 28/03/2024.
//

import SwiftUI

struct UserDetailImageView: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .cornerRadius(7)
            //.scaledToFit()
            .shadow(radius: 10)
            .padding()
            .frame(height: 300)
            
    }
}
