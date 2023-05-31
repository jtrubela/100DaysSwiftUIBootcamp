//
//  ContentView.swift
//  Student Account
//
//  Created by Justin Trubela on 12/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State var textFieldTempName = ""
    @State private var name = "Justin Trubela"
    var classes = ["None","Computer Systems", "Data Structures & Algorithms"]
    @State private var selectedClass = ""
    @State private var studentStatus = ""
    @State private var examStatus = ""
    

    var body: some View {

        
        NavigationView{
            Form{
                Section{
                    TextField("Enter new name", text: $textFieldTempName)
                    Button("Submit new name"){
                        name = textFieldTempName
                        textFieldTempName = ""
                        tapCount += 1
                    }
                }
                Section {
                    Text("Welcome \(name)")
                }
                
                Picker("Select class", selection: $selectedClass){
                    ForEach(classes, id: \.self) {
                        Text($0)
                    }
                }
                Text("Exam Status: \(examStatus)")
                Text("Student's Status: \(studentStatus)")
                Button("Generate Status"){
                    if (selectedClass == classes[0]){
                        examStatus = ""
                        studentStatus = ""
                    }
                    else if (selectedClass == classes[1]){
                        examStatus = "\nFinal Exam is 12/16/21"
                        studentStatus = "You're in trouble"
                    }

                    else{
                        examStatus = "\nFinal Exam is 12/13/21"
                        studentStatus = "You're in good shape."

                    }
                    tapCount += 1
                }

                Section {
                    Button("Tap Count: \(tapCount)"){
                    tapCount += 1
                    }
                }
                Section {
                    Button("Reset Count"){
                        tapCount = 0
                    }
                    Button("Reset Name"){
                        name = ""
                    }
                    Button("Resent Progress"){
                        tapCount = 0
                        name = ""
                        selectedClass = classes[0]
                        examStatus = ""
                        studentStatus = ""
                    }
                }
            }

            .navigationTitle("Student Account").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
