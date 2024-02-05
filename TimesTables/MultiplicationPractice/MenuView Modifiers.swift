//
//  MenuView Modifiers.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI

//Menu View Modifiers
struct boxOverlay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color.black)
            )
    }
}
extension View {
    func addBoxOverlay() -> some View {
        modifier(boxOverlay())
    }
}



////Game View Modifiers
//struct buttonModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .frame(width: 290, height: 40, alignment: .center)
//            .background(Color.green)
//            .clipShape(RoundedRectangle(cornerRadius: 30))
//            .shadow(color: .black, radius: 1, x: 3, y: 3)
//    }
//}
//
//extension View {
//    func addButtonModifier() -> some View {
//        modifier(buttonModifier())
//    }
//}
