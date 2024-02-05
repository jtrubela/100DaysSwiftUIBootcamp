//
//  Animal.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI

struct animal: View {
    @State var animals = ["bear","buffalo","chick","chicken","cow","crocodile","dog","duck","elephant","frog","giraffe","goat","gorilla","hippo","horse","monkey","monkey","moose","narwhal","owl","panda","parrot","penguin","pig","rabbit","rhino","sloth","snake","walrus","whale","zebra"].shuffled()
    @Binding var spinAnimation: Double
    
    var body: some View {
        VStack {
            Button(){
            } label: {
                Image("\(animals[20])")
                    .padding()
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
                    .animation(
                        .interactiveSpring()
                        .speed(0.5),value: spinAnimation)
            }
        }
        .animation(.interpolatingSpring(stiffness: 2, damping: 10), value: spinAnimation)
        .rotation3DEffect(.degrees(spinAnimation), axis: (x:2,y:1,z:0))
        
    }
}
