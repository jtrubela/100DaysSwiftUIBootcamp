//
//  BedtimeView.swift
//  BetterSleep
//
//  Created by Justin Trubela on 2/5/24.
//

import SwiftUI
import CoreML

struct BedtimeView: View {
    func calculateBedTime()-> String{
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: sleepTime)
        } catch {
            
            return "Error"
        }
    }
    var bedtime: String {
        calculateBedTime()
    }
    @Binding var wakeUp: Date
    @Binding var coffeeAmount: Int
    @Binding var sleepAmount: Double
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Spacer()
            Section(header: Text("You should get to bed around:")
                .font(.title2)
                .foregroundColor(.blue)) {
                    Text("\(bedtime)")
                        .font(.system(size: 50.0).bold().italic())
                        .foregroundColor(.blue)
                    Spacer()
                    Text("\tSleep Better\n with BetterSleep")
                        .font(.largeTitle.italic())
                        .foregroundColor(.red)
                }
            Spacer()
        }
    }
}
