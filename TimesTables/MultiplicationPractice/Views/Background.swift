//
//  Background.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI

struct GameBackground: View {
    var body: some View {
        LinearGradient(gradient:
                        Gradient(
                            colors: [.yellow,.yellow,.white,.white]),
                       startPoint: .top, endPoint: .bottom
        ).ignoresSafeArea()
    }
}
