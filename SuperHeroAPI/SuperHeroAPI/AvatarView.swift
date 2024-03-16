//
//  AvatarView.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

struct AvatarView: View {
    let image: Image
    @EnvironmentObject var navigationPath: NaviPath
    
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

