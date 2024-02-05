//
//  ContentView.swift
//  BetterSleep
//
//  Created by Justin Trubela on 12/26/21.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        ZStack{
            MyBackground()
            NavigationView {
                ZStack {
                    MyBackground()
                    InputFieldItems(wakeUp: $wakeUp, sleepAmount: $sleepAmount, coffeeAmount: $coffeeAmount)
                    .navigationTitle("BetterSleep")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).clipShape(RoundedRectangle(cornerRadius: 60))
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
