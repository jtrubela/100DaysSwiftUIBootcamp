/*//
//  GameView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 1/5/22.
//

import SwiftUI

struct GameView: View {
    @StateObject private var model = GameViewModel()
    
    // View settings
    @State private var gameView = true
    @State private var resultsView = false
    @State private var animals = ["bear","buffalo","chick","chicken","cow","crocodile","dog","duck","elephant","frog","giraffe","goat","gorilla","hippo","horse","monkey","monkey","moose","narwhal","owl","panda","parrot","penguin","pig","rabbit","rhino","sloth","snake","walrus","whale","zebra"].shuffled()
    // Calculate random animal
//    var randomAnimal: Int {
//        let number = Int.random(in: 0...30)
//        return number
//    }
    
    // User settings
    @State public var numQuestions: Int
    @State public var numChosen: Int
    // User math settings
    @State private var answer = 0
    @State private var answers = [0,0,0,0].shuffled()
    @State private var multiplyBy = 1
    var getAnswers: [Int] {
        //Shows the user the multiplied answer by one number lower
        let tempNum1minus = (model.multiplyBy * model.numChosen) - model.numChosen
        //Shows the user the multiplied answer by one number higher
        let tempNum2plus = (model.multiplyBy * model.numChosen) + model.numChosen
        //Shows the user the correct answer
        model.answer = model.multiplyBy * (model.numChosen)
        
        return [tempNum1minus, tempNum2plus, model.answer].shuffled()
    } // Calculate the answer and 1 above and 1 below
      
    // Calculate multiplier
    var getMultiplier: Int {
        model.multiplyBy = Int.random(in: 1...12)
        return multiplyBy
    }
    
    // Alert settings
    @State private var alertMessage = ""
    @State private var alertIsShowing = false
    
    // Animation settings
    @State private var chalkboardAnimationAmount = 0.0
    @State private var spinAnimation = 0.0

    // Game settings
    @State private var questionCount = 0
    @State private var selectedAnswer = 0
    @State private var score = 0
    
    var body: some View {
        if gameView {
            NavigationView {
                ZStack{
                    GameBackground()
 
                    VStack{
                        HStack{
                            Text("Multiply By \(numChosen)")
                                .font(.title)
                            Spacer()
                            Text("score: \(score)")
                                .font(.headline)
                        }.padding(.horizontal)
                        ZStack{

                            Blackboard(spinAnimation: $spinAnimation)
                  
                            BlackboardViewItem(numChosen: $model.numChosen, multiplyBy: $model.multiplyBy)
                        }
                            VStack{
//            Selection 1
                            AnimalSelectionView(questionNumber: 0, answers: answers, selectedAnswer: $selectedAnswer, spinAnimation: $spinAnimation)
//            Selection 2
                            AnimalSelectionView(questionNumber: 1, answers: answers, selectedAnswer: $selectedAnswer, spinAnimation: $spinAnimation)
//            Selection 3
                            AnimalSelectionView(questionNumber: 2, answers: answers, selectedAnswer: $selectedAnswer, spinAnimation: $spinAnimation)
                        }
                        .frame(width: 300, height: 520, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.black)
                        .font(.title2)
                    }
                }
                .onAppear(perform: model.addNewQuestion)
            }
            .alert(alertMessage, isPresented: $alertIsShowing){
                Button("Continue", action: model.addNewQuestion)
            } message: {
                Text("Your score is: \(model.score)/\(model.questionCount)")
            }
        }
        else{
            ResultsView(score: model.score, questionCount: model.questionCount)
        }
    }

    func showResults() {
        gameView.toggle()
        resultsView.toggle()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(numQuestions: 5, numChosen: 2)
    }
}
*/







//
//  GameView.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 1/5/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct GameView: View {
    // View settings
    @State private var gameView = true
    @State private var resultsView = false
    
    
    @State private var animals = ["bear","buffalo","chick","chicken","cow","crocodile","dog","duck","elephant","frog","giraffe","goat","gorilla","hippo","horse","monkey","monkey","moose","narwhal","owl","panda","parrot","penguin","pig","rabbit","rhino","sloth","snake","walrus","whale","zebra"].shuffled()
    // Calculate random animal
    var randomAnimal: Int {
        let number = Int.random(in: 0...30)
        return number
    }
    
    
    
    
    
    
    
    
    
    
    // User settings
    @State public var numQuestions: Int
    @State public var numChosen: Int
    
    
    
    
    
    
    
    
    // User math settings
    @State private var answer = 0
    @State private var answers = [0,0,0,0].shuffled()
    @State private var multiplyBy = 0
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
    
    // Alert settings
    @State private var alertMessage = ""
    @State private var alertIsShowing = false
    
    // Animation settings
    @State private var chalkboardAnimationAmount = 0.0
    @State private var spinAnimation = 0.0
    
    // Game settings
    @State private var questionCount = 0
    @State private var selectedAnswer = 0
    @State private var score = 0
    

    @StateObject private var model = GameViewModel()
    
    var body: some View {
        
        NavigationStack(path: $pathState.path) {
            
            GameBackground().ignoresSafeArea()
            VStack{
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
        
        
        if gameView {
            NavigationView {
                ZStack{
                    LinearGradient(gradient:
                                    Gradient(
                                        colors: [.yellow,.yellow,.white,.white]),
                                   startPoint: .top, endPoint: .bottom
                    ).ignoresSafeArea()
                    VStack{
                        Text("Multiply By \(numChosen)")
                            .position(x: 110, y: 0)
                            .font(.title)
                        Text("score: \(score)")
                            .position(x: 320, y: 0)
                            .font(.headline).padding()
                        
                        ZStack{
                            Spacer()
                            VStack {
                                Button() {
                                    withAnimation{
                                        spinAnimation += 360
                                        addNewQuestion()
                                    }
                                } label: {
                                    ZStack {
                                        Image("FunBoard")
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 5)
                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                    }
                                }
                            }
                            .rotation3DEffect(.degrees(spinAnimation), axis: (x:0,y:1,z:0))
                            .animation(.linear(duration: 0.4), value: spinAnimation)
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .frame(width: 180, height: 50, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                Button(){
                                    model.addNewQuestion()
                                } label: {
                                    Text("\(numChosen)     X     \(multiplyBy)")
                                        .font(.largeTitle).bold()
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        VStack{
                            Spacer()
                            /*Selection 1*/VStack {
                                Button() {
                                } label: {
                                    Image("\(animals[randomAnimal])")
                                }
                                Button(){
                                    selectedAnswer = answers[0]
                                    determineOutcome()
                                } label: {
                                    Text("\(answers[0])")
                                        .frame(width: 280, height: 30, alignment: .center)
                                }.addButtonModifier()
                            }
                            /*Selection 2*/VStack {
                                Button() {
                                } label: {
                                    Image("\(animals[randomAnimal])")
                                }
                                Button(){
                                    selectedAnswer = answers[1]
                                    determineOutcome()
                                } label: {
                                    Text("\(answers[1])")
                                        .frame(width: 280, height: 30, alignment: .center)
                                }.addButtonModifier()
                            }
                            /*Selection 3*/VStack {
                                Button() {
                                } label: {
                                    Image("\(animals[randomAnimal])")
                                }
                                Button(){
                                    selectedAnswer = answers[2]
                                    determineOutcome()
                                } label: {
                                    Text("\(answers[2])")
                                        .frame(width: 280, height: 30, alignment: .center)
                                }.addButtonModifier()
                            }
                            Spacer()
                        }
                        .frame(width: 300, height: 460, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.black)
                        .font(.title2)
                    }
                }
                .onAppear(perform: addNewQuestion)
            }
            .alert(alertMessage, isPresented: $alertIsShowing){
                Button("Continue", action: addNewQuestion)
            } message: {
                Text("Your score is: \(score)/\(questionCount)")
            }
        }
        else{
            ResultsView(score: score, questionCount: questionCount)
        }
    }
    
    func determineOutcome () {
        questionCount += 1
        if selectedAnswer == answer {
            score += 1
            if questionCount == numQuestions {
                showResults()
            }
            else {
                addNewQuestion()
            }
        }
        else {
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
}

struct buttonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 290, height: 40, alignment: .center)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .black, radius: 1, x: 3, y: 3)
    }
}

extension View {
    func addButtonModifier() -> some View {
        modifier(buttonModifier())
    }
}
@available(iOS 16.0, *)
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(numQuestions: 5, numChosen: 2)
    }
}
