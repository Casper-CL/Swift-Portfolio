//
//  SuperHeroSearchCellView.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

struct SuperHeroSearchCellView: View {
    var superHero: SuperHero
    @EnvironmentObject var navigationPath: NaviPath
    var body: some View {
        HStack{
            AsyncImage(url: superHero.image.url){image in
                AvatarView(image: image)
            }placeholder: {
               ProgressView()
            }
             
            Text(superHero.name).padding()
        }
    }
}

