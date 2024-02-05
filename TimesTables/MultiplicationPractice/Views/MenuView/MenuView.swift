//
//  MenuView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 1/5/22.
//

import SwiftUI

struct MenuView: View {
    @StateObject var model = GameViewModel()

    @State private var numQuestions = 5
    @State private var selectedNumber = 0.0
    @State private var numChosen = 2.0
    @State private var menuView = true
    
    @State private var spinAnimation = 0.0
    
    var body: some View {
        if menuView {
            NavigationView{
                ZStack{
                    Color.yellow.ignoresSafeArea()
                    VStack {
                        MenuView_Items(numQuestions: $numQuestions, numChosen: $numChosen, selectedNumber: $selectedNumber, spinAnimation: $spinAnimation)
                        Spacer()
                    }
                .navigationBarTitle("Times Tables")
            }.toolbar{
                Button("Play", action: playGame)
            }
        }
            NavigationLink(destination: GameView(
                numQuestions: self.numQuestions,
                numChosen: Int(self.numChosen))){}
        }
        else {
                GameView(numQuestions: numQuestions, numChosen: Int(numChosen))
        }
    }
    
    func playGame() {
        menuView.toggle()
    }

}

struct ContentViewsss_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
