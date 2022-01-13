//
//  MissionDetailView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import SwiftUI

struct SSMissionDetailView: View {
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text(mission.formattedLaunchDate)
                    .bold()
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                Text(mission.description)
                    .padding(.bottom)
                
                ForEach(mission.crew, id: \.id) { member in
                    HStack {
                        Image(member.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75)
                            .cornerRadius(10)
                        
                        Text(member.name)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(mission.displayName)
    }
}

struct SSMissionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SSMissionDetailView(mission: .example)
    }
}
