//
//  DetailImageView.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

struct DetailImageView: View {
    var image: Image
    @EnvironmentObject var navigationPath: NaviPath
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            //.frame(width: 200, height: 200, alignment: .center)
            .shadow(radius: 10)
            .padding()
            
    }
}
