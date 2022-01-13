//
//  MissionItemView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import SwiftUI

struct SSMissionItemView: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Image(mission.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(mission.displayName)
                
                Text(mission.formattedLaunchDate)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .padding(5)
    }
}

struct SSMissionItemView_Previews: PreviewProvider {
    static var previews: some View {
        SSMissionItemView(mission: .example)
    }
}
