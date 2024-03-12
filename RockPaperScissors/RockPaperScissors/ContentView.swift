//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Casper Lefevre on 07/02/2024.
//

import SwiftUI

struct buttonPresetModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.blue)
            .cornerRadius(4)
            .foregroundColor(.white)
            .frame(height: 75)
            .shadow(radius: 5)
    }
}
extension View{
    func buttonPreset() -> some View{
        modifier(buttonPresetModifier())
    }
}
let options = ["rock", "paper", "scissors"]
let winningMoves = ["paper", "scissors", "rock"]

struct ContentView: View {
    
    @State private var move = Int.random(in: 0...2)
    
    @State private var pcMoveString: String = "Ready?"
    @State private var showMove: Bool = false
    @State private var win = false;
    @State private var winningTitle = ""
    @State private var winCount = 0
    @State private var loseCount = 0
    @State private var tieCount = 0
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.75, green: 0.75, blue: 0.75), location: 0.3),
                    .init(color: Color(red: 1, green: 1, blue: 1), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 800)
                .ignoresSafeArea()
                .blur(radius: 2.0)
                VStack {
                    
                        Text(pcMoveString)
                            .font(.system(size: 100))
                        Text(winningTitle)
                        .bold()
                        Text("Win count: \(winCount)")
                        Text("Lose count: \(loseCount)")
                        Text("Tie count: \(tieCount)")
                    
                    Spacer()
                    Button("Rock"){
                        pressed(choose: 0)
                    }
                    .buttonPreset()
                    Button("Paper"){
                        pressed(choose: 1)
                    }
                    .buttonPreset()
                    Button("Scissors"){
                        pressed(choose: 2)
                    }
                    .buttonPreset()
                    Spacer()
                    Button("Reset score"){
                        resetScore()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Rock Paper Scissors")
        }
    }
    
    func pressed(choose: Int){
        let userChoice = options[choose]
        let computerChoice = options[move]
        
        switch computerChoice{
        case "paper": pcMoveString = "📄"
        case "rock": pcMoveString = "🪨"
        case "scissors": pcMoveString = "✂️"
        default:     
            preconditionFailure("Invalid computerChoice value: \(computerChoice)")
        }
        
        if userChoice == computerChoice {
                winningTitle = "It's a tie!"
                tieCount += 1
            } else if userChoice == winningMoves[move] {
                winningTitle = "You win!"
                win = true
                winCount += 1
            } else {
                winningTitle = "You lose!"
                win = false
                loseCount += 1
            }
        
        showMove = true
        win = true
        move = Int.random(in: 0...2)
        
    }
    func resetScore(){
        winCount = 0
        loseCount = 0
        tieCount = 0
        pcMoveString = "Ready?"
        winningTitle = ""
    }
}





#Preview {
    ContentView()
}
