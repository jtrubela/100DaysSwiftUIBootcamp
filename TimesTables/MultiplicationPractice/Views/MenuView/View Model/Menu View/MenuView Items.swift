//
//  MenuView Items.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI

struct MenuView_Items: View {
    @Binding var numQuestions: Int
    @Binding var numChosen: Double
    @Binding var selectedNumber: Double
    @Binding var spinAnimation: Double
    var body: some View {
        VStack {
            MultiplyingNumberView(numChosen: $numChosen, selectedNumber: $selectedNumber, spinAnimation: $spinAnimation)
            NumberOfQuestionsView(numQuestions: $numQuestions, spinAnimation: $spinAnimation)
            Spacer()
        }                    
            .padding(30)

    }
}

struct MultiplyingNumberView: View {
    @Binding var numChosen: Double
    @Binding var selectedNumber: Double
    @Binding var spinAnimation: Double
    
    
    var body: some View {
        animal(spinAnimation: $spinAnimation)
        
        VStack {
            Text("Pick a number to multiply by")
                .font(.headline)
            
            HStack {
                // Minus Sign
                Button {
                    minusButton()
                } label: {
                    Text("\(Image(systemName: "minus"))")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .bold()
                }
                
                Slider(value: $numChosen, in: 2...12, step: 1)
                // Plus Sign
                Button {
                    plusButton()
                } label: {
                    Text("\(Image(systemName: "plus"))")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .bold()
                }
            }
            .padding()
            .accentColor(Color.blue)
        }
        .addBoxOverlay()
        
        Text("\(Int(numChosen))")
            .font(.largeTitle)
            .foregroundColor(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(width: 320, height: 50, alignment: .center)
    }
    
    func minusButton(){
        if numChosen == 2{
            numChosen = numChosen
            selectedNumber = numChosen
        }
        else{
            numChosen -= 1
            selectedNumber = numChosen
            spinAnimation -= 180
        }
        numChosen = Double(selectedNumber)
    }
    func plusButton(){
        if numChosen == 12{
            numChosen = numChosen
        }
        else{
            numChosen += 1
            spinAnimation -= 180
        }
    }
}

struct NumberOfQuestionsView: View {
    @Binding var numQuestions: Int
    @Binding var spinAnimation: Double
    
    let numberOfQuestions = [5, 10, 15, 20]
    
    var body: some View {
        animal(spinAnimation: $spinAnimation)
        VStack {
            Text("Pick how many questions you want")
            
            Picker("How many questions", selection: $numQuestions) {
                ForEach(numberOfQuestions, id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
        .addBoxOverlay()
    }
}
