//
//  InputFieldItems.swift
//  BetterSleep
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI

struct InputFieldItems: View {
    @Binding var wakeUp: Date
    @Binding var sleepAmount: Double
    @Binding var coffeeAmount: Int

    var body: some View {
        VStack{
            WakeUpTime(wakeUp: $wakeUp)
            
            SleepAmountStepper(sleepAmount: $sleepAmount)
            
            CoffeeAmountPicker(coffeeAmount: $coffeeAmount)
            
            BedtimeView(wakeUp: $wakeUp, coffeeAmount: $coffeeAmount, sleepAmount: $sleepAmount)
        }
    }
}

struct WakeUpTime: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @Binding var wakeUp: Date
    var body: some View {
        VStack(alignment: .center){
            Text("Set wake up time:")
                .addTextStyle()
            
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents:
                    .hourAndMinute)
            .labelsHidden()
            .addTextStyle()
        }
        .makeRoundedBackground()
    }
}

struct SleepAmountStepper: View {
    @Binding var sleepAmount: Double
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Text("Desired amount of sleep")
                .addTextStyle()
            Stepper("  \(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                .addTextStyle()
                .padding(.horizontal)
        }
        .makeRoundedBackground()
    }
}

struct CoffeeAmountPicker: View {
    @Binding var coffeeAmount: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Text("Daily coffee intake")
                .addTextStyle()
            
            Picker(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                ForEach(1..<21) {
                    if $0 == 1{
                        Text("1 cup")
                    }
                    else{
                        Text("\($0) cups")
                    }
                }
            }
        }
        .makeRoundedBackground()
    }
}
