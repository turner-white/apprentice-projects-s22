//
//  LogInView.swift
//  p05-socialmedia
//
//  Created by Turner White on 2/22/22.
//

import SwiftUI

struct LogInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack(alignment:.center) {
            Form{
                TextField("username", text: $username)
                    .padding(.all)
                TextField("password", text: $password)
                    .padding(.all)
                    
            }
            Section{
                Button("Log In") {
                    
                }
            }
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
