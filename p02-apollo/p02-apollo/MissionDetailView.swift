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
        Text("Hello, World!")
    }
}

struct MissionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailView(mission: .example)
    }
}
