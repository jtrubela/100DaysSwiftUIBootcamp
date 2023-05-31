//
//  ContentView.swift
//  Moonshot
//
//  Created by Justin Trubela on 05/30/2023
//

import SwiftUI

struct ContentView: View {
    let control = MissionControl()

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(control.missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: control.astronauts)
                        } label: {
                            MissionCard(mission: mission)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
