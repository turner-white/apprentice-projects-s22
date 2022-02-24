//
//  SignUpView.swift
//  p05-socialmedia
//
//  Created by Turner White on 2/22/22.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var password: String = ""
    @State var password2: String = ""
    //var profile: Profile.defaultProfile
    var body: some View {
        VStack {
            Form {
                TextField("Username",text:$username)
                TextField("First Name", text:$firstname)
                TextField("Last Name", text: $lastname)
                TextField("Password",text:$password)
                TextField("Confirm Password", text:$password2)
            }.frame(height:600)
            Button("Create Account") {
                
            }
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
