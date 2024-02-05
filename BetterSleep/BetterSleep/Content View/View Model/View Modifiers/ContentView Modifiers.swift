//
//  ContentView Modifiers.swift
//  BetterSleep
//
//  Created by Justin Trubela on 2/4/24.
//

import SwiftUI

struct RoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 90, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 20))
            .foregroundColor(.white).padding(.top)
    }
}
extension View {
    func makeRoundedBackground () -> some View{
        modifier(RoundedBackground())
    }
}

struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.black)
        //            .padding()
    }
}

extension View {
    func addTextStyle () -> some View {
        modifier(TextStyle())
    }
}
