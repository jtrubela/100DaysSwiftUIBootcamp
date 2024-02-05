//
//  Background.swift
//  BetterSleep
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI

struct MyBackground: View {
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .black
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.purple,.black,.black], startPoint: .bottom, endPoint: .top).ignoresSafeArea()
        }
    }
}
