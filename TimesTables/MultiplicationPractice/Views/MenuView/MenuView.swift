//
//  MenuView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 1/5/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct MenuView: View {
    @StateObject var model = GameViewModel()
    @StateObject var pathState = PathState()


    @State private var numQuestions = 5
    @State private var selectedNumber: Double = 0.0
    @State private var numChosen: Double = 2.0
    
    @State private var spinAnimation = 0.0
    
    var body: some View {
            NavigationStack(path: $pathState.path) {
                
                GameBackground().ignoresSafeArea()
                VStack{
                    
                    MenuView_Items(numQuestions: $numQuestions, numChosen: $numChosen, selectedNumber: $selectedNumber, spinAnimation: $spinAnimation)
                        Spacer()
                    .navigationBarTitle("Times Tables")
                    .toolbar{
                        NavigationLink("Play", value: PathState.Destination.gameView)
                    }
                }
                .navigationDestination(for: PathState.Destination.self, destination: { destination in
                    switch destination {
                        case .menuView:
                            MenuView()
                        case .gameView:
                            GameView(numQuestions: Int(selectedNumber), numChosen: numQuestions)
                        case .resultsView:
                            ResultsView(score: 0, questionCount: numQuestions)
                    }
                })
                .padding()
            }
    }
}

@available(iOS 16.0, *)
struct ContentViewsss_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
