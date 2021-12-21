//
//  ContentView.swift
//  GuessTheFlag
//
// Create a Guess That Flag guessing game that allows the user to choose a flag given a country.
// each flag(10 int total) will be shuffled at random
// a random generated number from 0 - 2(amount of flags shown) will be given
// we would need to check the users choice against the given flags
// if it is correct increase the users score
// if it is wrong, relay an alert back to the user
//
//  Created by Justin Trubela on 12/17/21.
//

import SwiftUI


struct ContentView: View {
    @State private var countries = ["Estonia","US","Spain","Germany","France","Ireland","Poland","Russia","UK","Italy"].shuffled()
    
    @State private var correctResponses = ["Superb","Fantastic","Correct","You're good at this","Nice! You should do this for a living"].shuffled()
    @State private var wrongResponses = ["Incorrect. Try again","You had a 33% chance of guessing right and you didn't","Nope"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var gameOver = false

    @State private var scoreTitle = ""
    @State private var questionCount = 1
    @State private var score = 0
    
    @State private var oldScore = 0
    @State private var oldQCount = 0
    

    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.0 , green: 0.9, blue: 0.0) , location: 0.3),
                .init(color: .white, location: 0.7),
            ],   center: .top, startRadius: 100, endRadius: 400)
                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: .black , location: 0.3),
                .init(color: .secondary, location: 0.8),
            ],   center: .bottom, startRadius: 80, endRadius: 600).ignoresSafeArea()
            
            if !gameOver {
                VStack{
                    Text("Guess the Flag")
                        .font(.largeTitle).foregroundColor(.primary)
                        .bold()
                    
                    VStack(spacing: 5){
                        VStack{
                            Text("Tap the flag of")
                                .foregroundColor(.white).font(.title).italic().bold()
                            Text(countries[correctAnswer]).font(.title).bold()
                        }.padding(30)
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 50)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    Text("Score: \(score)").font(.largeTitle).foregroundColor(.white).bold()
                    Spacer()
                    
                }.padding(50)
                
            }
            else{
                VStack{
                    VStack{
                        Text("Final score is: \(oldScore)/\(oldQCount)").foregroundColor(.white).font(.largeTitle)
                        Button("Play Again"){
                            gameOver = false
                            askQuestion()
                        }.buttonStyle(.borderedProminent).font(.title2).cornerRadius(20).padding()
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(score)/\(questionCount)")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "\(correctResponses[0])"
            score+=1
        } else {
            scoreTitle = "\(wrongResponses[0])\nYou clicked on \(countries[number])'s flag"
        }
        showingScore = true
    }
    
    func askQuestion() {
        if questionCount > 7{
            oldScore = score
            oldQCount = questionCount
            reset()
            askQuestion()
        } else {
            shuffleUp()
            
            correctAnswer = Int.random(in: 0...2)
            questionCount += 1
        }
    }
    
    func shuffleUp(){
        countries.shuffle()
        correctResponses.shuffle()
        wrongResponses.shuffle()
    }
    
    func reset() {
        score = 0
        questionCount = 0
        
        gameOver = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
    }
}
