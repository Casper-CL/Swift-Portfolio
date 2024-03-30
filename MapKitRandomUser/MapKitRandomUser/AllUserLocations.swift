//
//  AllUserLocations.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 29/03/2024.
//

import SwiftUI
import MapKit

struct AllUserLocations: View {
    @EnvironmentObject var stateController: StateController
    @EnvironmentObject var naviPath: NaviPath
    var body: some View {
        
        
            VStack{
                Text("All users location")
                Map{
                    ForEach(stateController.users){user in
                        let coordinates = CLLocationCoordinate2D(latitude: Double(user.location.coordinates.latitude) ?? 0, longitude: Double(user.location.coordinates.longitude) ?? 0)
                        Annotation("\(user.name.first)", coordinate: coordinates){
                            AsyncImage(url: user.picture.medium){image in
                                MapImageView(image: image)
                            }placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    
                }
                .clipShape(Circle())
                .scaledToFit()
                .padding()
                .mapStyle(.standard)
                
                
                
                .navigationTitle("User Locations")
            }
            
        
        
    }
}

#Preview {
    AllUserLocations()
        .environmentObject(StateController())
        .environmentObject(NaviPath())
}

