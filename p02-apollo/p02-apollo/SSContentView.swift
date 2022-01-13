//
//  SSContentView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/12/22.
//

import SwiftUI

struct SSContentView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List {
                ForEach(missions, id: \.id) { mission in
                    NavigationLink {
                        MissionDetailView(mission: mission)
                    } label: {
                        SSMissionItemView(mission: mission)
                    }
                }
            }
            .navigationTitle("NASA Missions")
        }
    }
}

struct SSContentView_Previews: PreviewProvider {
    static var previews: some View {
        SSContentView()
    }
}
