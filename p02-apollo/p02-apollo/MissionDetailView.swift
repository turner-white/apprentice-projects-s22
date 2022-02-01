//
//  MissionDetailView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/12/22.
//

import SwiftUI

struct MissionDetailView: View {
    // use this mission to display the content on the detail view
    let mission: Mission
    
    
    var body: some View {
        ScrollView {
            mission.image
                .imageScale( .medium)
                .scaleEffect(0.7)
                .padding(.bottom,-60)
                .shadow(radius: 10)
            Text(mission.formattedLaunchDate)
            VStack (alignment: .leading) {
                HStack {
                    Text(mission.displayName)
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }
                Divider()
                Text(mission.description)
                //Image(mission.crew[0].imageName)
                Text("Crew")
                    .font(.subheadline)
                Divider()
                    ForEach(mission.crew) { member in
                        HStack {
                            Image(member.imageName)
                                .frame(width:25,height:25)
                                .scaleEffect(0.2)
                            Text(member.name)
                                .padding(.leading,40)
                        }
                        .padding()
                    
                    }
                }
                
            }
        }
        
    }


struct MissionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailView(mission: .example)
    }
}
