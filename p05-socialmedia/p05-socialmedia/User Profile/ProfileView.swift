//
//  ProfileView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileView: View {
    let name: String = "App Team Carolina"
    let username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    
    let userPosts: [Post] = PostList.defaultPosts

    var body: some View {
        NavigationView {
            ScrollView {
                Image(profileImageAddress)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:180,height:180)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(name)")
                            .font(.title)
                        Text("Username: @\(username)")
                            .font(.subheadline)
                    }
                    Spacer()
                    NavigationLink(destination: ProfileSettings()) {
                        Label("Settings button", systemImage: "gearshape.fill")
                            .labelStyle(.iconOnly)
                            .scaledToFit()
                    }
                }
                Divider()
                ForEach(userPosts) { post in
                    PostView(post: post)
                }
            }.padding(.leading)
                .padding(.trailing)
                .navigationTitle(Text("Profile Home"))
                .navigationBarHidden(true)
        }
        }



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
}
