//
//  ContentView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    // use this array of missions to show your mission content
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
            NavigationView {
                    List {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionDetailView(mission: mission)
                            } label: {
                                MissionRow(mission: mission)
                            }
                        }
                    
                    }
                    
            }
            .navigationTitle("NASA Apollo Missions")
            
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
