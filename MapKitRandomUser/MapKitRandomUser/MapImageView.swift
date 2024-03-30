//
//  MapImageView.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 29/03/2024.
//

import SwiftUI

struct MapImageView: View {
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
            .frame(width: 30, height: 30)
    }
}
