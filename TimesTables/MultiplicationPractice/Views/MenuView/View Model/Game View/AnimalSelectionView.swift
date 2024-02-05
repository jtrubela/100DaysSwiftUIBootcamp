//
//  AnimalSelectionView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI


struct AnimalSelectionView: View {
    @StateObject var model = GameViewModel()
    var questionNumber: Int
    
    var answers: [Int]
    
    @Binding var selectedAnswer: Int
    @Binding var spinAnimation: Double
    
    var body: some View {
        VStack {
            Button {
                // Your logic for the first button
            } label: {
                animal(spinAnimation: $spinAnimation)
            }
            
            Button {
                selectedAnswer = answers[questionNumber]
                model.determineOutcome()
            } label: {
                Text("\(answers[questionNumber])")
                    .frame(width: 280, height: 30, alignment: .center)
            }
            .addButtonModifier()
        }
    }
}

