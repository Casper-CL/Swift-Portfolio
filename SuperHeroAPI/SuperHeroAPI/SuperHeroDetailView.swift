//
//  SuperHeroDetailView.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import SwiftUI

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

struct SuperHeroDetailView: View {
    @State var superHero: SuperHero
    @EnvironmentObject var navigationPath: NaviPath
    @EnvironmentObject var stateController: StateController
    var body: some View {
        Form{
            VStack{
                
                    AsyncImage(url: superHero.image.url){image in
                        DetailImageView(image: image)
                    }placeholder: {
                        ProgressView()
                    }
                
                
                Text("Stats")
                    .HeadlinerStyle()
                /*
                 Hvis man skal rykke teksten ud til siden
                 .padding(EdgeInsets(top: 0, leading: -0.35 * UIScreen.main.bounds.width, bottom: 0, trailing: 0.15 * UIScreen.main.bounds.width))
                 */
                
                Section{
                        Text("Intelligence ").bold() + Text("\(superHero.powerstats.intelligence)")
                        Text("Strength ").bold() + Text("\(superHero.powerstats.strength)")
                        Text("Speed ").bold() + Text("\(superHero.powerstats.speed)")
                        Text("Durability ").bold() + Text("\(superHero.powerstats.durability)")
                        Text("Power ").bold() + Text("\(superHero.powerstats.power)")
                        Text("Combat ").bold() + Text("\(superHero.powerstats.combat)")
                    
                }
                .padding(4)
                
                Text("Biography")
                    .HeadlinerStyle()
                
                Section{
                    Text("Full Name ").bold()
                    Text("\(superHero.biography.fullName)")
                    Text("Place of Birth ").bold()
                    Text("\(superHero.biography.placeOfBirth)")
                    Text("First Appearance ").bold()
                    Text("\(superHero.biography.firstAppearance)")
                    Text("Alignment ").bold()
                    Text("\(superHero.biography.alignment)")
                    VStack {
                        Text("Aliases").bold()
                        List(superHero.biography.aliases, id: \.self) { alias in
                            Text(alias)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .padding(4)
                
                Text("Appearance")
                    .HeadlinerStyle()
                
                Section{
                    Text("Gender ").bold() +  Text("\(superHero.appearance.gender)")
                    Text("Race ").bold() + Text("\(superHero.appearance.race)")
                    Text("Height ").bold() + Text("\(superHero.appearance.height[1])")
                    Text("Weight ").bold() + Text("\(superHero.appearance.weight[1])")
                    Text("Eye Color ").bold() + Text("\(superHero.appearance.eyeColor)")
                    Text("Hair Color ").bold() + Text("\(superHero.appearance.hairColor)")
                }
                .padding(4)
                
                Text("Work")
                    .HeadlinerStyle()
                
                Section{
                    Text("Occupation ").bold()
                    Text("\(superHero.work.occupation)")
                    Text("Base ").bold()
                    Text("\(superHero.work.base)")
                }
                .padding(4)
                
                Text("Connections")
                    .HeadlinerStyle()
                
                Section {
                    VStack(alignment: .center){
                        Text("Group Affiliation").bold()
                        List(superHero.connections.groupAffiliation.split(separator: ","), id: \.self){ga in
                            ForEach(ga.split(separator: ";"), id: \.self){af in
                                Text(af)
                            }
                        }
                    }
                    
                    VStack(alignment: .center){
                        Text("Relatives").bold()
                        List(superHero.connections.relatives.split(separator: ","), id: \.self){r in
                            ForEach(r.split(separator: ";"), id: \.self){re in
                                Text(re)
                            }
                        }
                    }
                }
                .padding(4)
            }
            
            .navigationTitle(superHero.name)
        }
        
        
        HStack(alignment: .center){
            Spacer()
            Button{
                navigationPath.routes.removeAll()
            }label: {
                Text("Frontpage")
            }
            
            Spacer()
            Button{
                navigationPath.routes.removeAll()
                navigationPath.routes.append(.SuperHeroSearchView)
                
            }label: {
                Text("Search")
            }
            
            Spacer()
            Button{
                navigationPath.routes.removeAll()
                navigationPath.routes.append(.SuperHeroList)
                
            }label: {
                Text("Herolist")
            }
            Spacer()
        }
    }
}
