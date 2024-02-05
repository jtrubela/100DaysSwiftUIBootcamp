//
//  Game Functions.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var questionCount = 0
    @Published var selectedAnswer = 0
    @Published var score = 0
    @Published var alertIsShowing = false
    @Published var alertMessage = ""
    @Published var numQuestions = 10 // Replace with your default value
    @Published var multiplyBy = 0
    @Published var numChosen = 10
    @Published var answer = 0
    @Published var answers = [0,0,0,0].shuffled()
    @Published var gameView = true
    @Published var resultsView = false
    @Published var chalkboardAnimationAmount = 0.0
    @Published var spinAnimation = 0.0


    var getAnswers: [Int] {
        //Shows the user the multiplied answer by one number lower
        let tempNum1minus = (multiplyBy * numChosen) - numChosen
        //Shows the user the multiplied answer by one number higher
        let tempNum2plus = (multiplyBy * numChosen) + numChosen
        //Shows the user the correct answer
        let answer = multiplyBy * (numChosen)
        
        return [tempNum1minus, tempNum2plus, answer].shuffled()
    } // Calculate the answer and 1 above and 1 below
    var getMultiplier: Int {
        multiplyBy = Int.random(in: 1...12)
        return multiplyBy
    } // Calculate multiplier
    
    

    func determineOutcome() {
        questionCount += 1
        if selectedAnswer == answer {
            score += 1
            if questionCount == numQuestions {
                showResults()
            } else {
                addNewQuestion()
            }
        } else {
            alertIsShowing.toggle()
            alertMessage = "Incorrect.\n Try Again.\nHint: Click on chalkboard to find it again"
            if questionCount >= numQuestions {
                showResults()
            }
        }
    }
    
    func addNewQuestion(){
        multiplyBy = getMultiplier
        answer = numChosen * multiplyBy
        answers = getAnswers
    }
    
    func showResults() {
        gameView.toggle()
        resultsView.toggle()
    }
    
    func animateBlackboard() {
        spinAnimation += 360
        addNewQuestion()
    }
}
