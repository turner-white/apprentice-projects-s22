//
//  LogInView.swift
//  p05-socialmedia
//
//  Created by Turner White on 2/22/22.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var modelData: ModelData
    @State var signedIn: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment:.center) {
                Text("Bluebird!").font(.largeTitle
                ).offset(y:-75)
                Image("blue-bird-vector")
                    .resizable()
                    .frame(width:300,height:300)
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 15) {
                    HStack{
                        TextField("username", text: $username)
                    }.modifier(customViewModifier(roundedCorners: 10, startColor: .blue, endColor: .cyan, textColor: .white))
                    HStack {
                        SecureField("password", text: $password)
                    }.modifier(customViewModifier(roundedCorners: 10, startColor: .cyan, endColor: .blue, textColor: .white))
                    
                }
                
                Button("Log In") {
                    modelData.showingLogIn.toggle()
                }
                .buttonStyle(.borderedProminent)
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                .offset(y:5)
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign up here")
                }.offset(y:50)
                
                
                
            }.padding()
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
