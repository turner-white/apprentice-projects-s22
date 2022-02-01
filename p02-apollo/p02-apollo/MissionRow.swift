//
//  MissionRow.swift
//  p02-apollo
//
//  Created by Turner White on 2/1/22.
//

import SwiftUI

struct MissionRow: View {
    var mission: Mission
    
    var body: some View {
        HStack {
            mission.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(mission.displayName)
            Spacer()
        }.padding()
    }
}

struct MissionRow_Previews: PreviewProvider {
//    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionRow(mission: .example)
    }
}
