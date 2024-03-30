//
//  UserDetailView.swift
//  MapKitRandomUser
//
//  Created by Casper Lefevre on 28/03/2024.
//

import SwiftUI
import MapKit



struct HeadlinerModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .padding(EdgeInsets(top: 0, leading: -0.40 * UIScreen.main.bounds.width, bottom: 0, trailing: -0.15 * UIScreen.main.bounds.width))
    }
}

extension View{
    func HeadlinerStyle() -> some View{
        modifier(HeadlinerModifier())
    }
}

struct UserDetailView: View {
    @State var user: User
    
    var body: some View {
        let userMarker = CLLocationCoordinate2D(latitude: Double(user.location.coordinates.latitude) ?? 0, longitude: Double(user.location.coordinates.longitude) ?? 0)
        Form{
            VStack{
                
                AsyncImage(url: user.picture.medium){image in
                    UserDetailImageView(image: image)
                }placeholder: {
                    ProgressView()
                }
                 
                
                Text("Location")
                    .HeadlinerStyle()
                
                Section{
                    Text("Country")
                        .bold()
                    Text("\(user.location.country)")
                    
                    Text("City")
                        .bold()
                    Text("\(user.location.city)")
                    
                    Text("Timezone")
                        .bold()
                    Text("\(user.location.timezone.description)")
                    
                    Text("Coordinates")
                        .bold()
                    Text("LO: \(user.location.coordinates.longitude), LA: \(user.location.coordinates.latitude)")
                }
                .padding(4)
                
                Section{
                    
                    Map{
                        Annotation("\(user.name.first)", coordinate: userMarker){
                            AsyncImage(url: user.picture.medium){image in
                                MapImageView(image: image)
                            }placeholder: {
                                ProgressView()
                            }
                        }
                    }
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .frame(height: 200)
                        .padding()
                        .mapStyle(.standard)
                        
                        
                }
                .padding(4)
            
                
                
            }
            
            .navigationTitle("\(user.name.title) \(user.name.first) \(user.name.last)")
        }
    }
    
}

/*
 // MARK: - Location
 struct Location: Codable {
 let street: Street
 let city, state, country: String
 let postcode: Int
 let coordinates: Coordinates
 let timezone: Timezone
 }
 
 // MARK: - Coordinates
 struct Coordinates: Codable {
 let latitude, longitude: String
 }
 
 // MARK: - Street
 struct Street: Codable {
 let number: Int
 let name: String
 }
 
 // MARK: - Timezone
 struct Timezone: Codable {
 let offset, description: String
 }
 
 
 // MARK: - Name
 struct Name: Codable {
 let title, first, last: String
 }
 */
