//
//  BlackboardView Items.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI


struct BlackboardViewItem: View {
    @ObservedObject var model = GameViewModel()
    @Binding var numChosen: Int
    @Binding var multiplyBy: Int
    var body: some View {
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
}

struct Blackboard: View {
    @ObservedObject var model = GameViewModel()
    @Binding var spinAnimation: Double
    
    var body: some View {
        VStack {
            Button() {
                withAnimation{
                    spinAnimation += 360
                    model.addNewQuestion()
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
        
    }
}

