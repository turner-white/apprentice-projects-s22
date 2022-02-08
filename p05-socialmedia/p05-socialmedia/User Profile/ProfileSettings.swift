//
//  ProfileSettings.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileSettings: View {
    var body: some View {
        VStack {
            HStack {
                Text("Change Name")
                Divider()
            
            }
            HStack {
                Text("Change Username")
                Divider()
            }
            Text("edit profile pic")
        }
    }
}

struct ProfileSettings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettings()
    }
}
