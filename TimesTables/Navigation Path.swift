//
//  Navigation Path.swift
//  MultiplicationPractice
//
//  Created by Justin Trubela on 2/5/24.
//

import Foundation

class PathState: ObservableObject {
    enum Destination: String, Hashable {
        case menuView, gameView, resultsView
    }
    @Published var path: [Destination] = []
}
