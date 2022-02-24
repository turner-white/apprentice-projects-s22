//
//  ContentView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @State private var signedIn: Bool = false
    @State private var selection: Tab = .home
    enum Tab {
        case home
        case post
        case profile
    }
    var body: some View {
        
        TabView(selection: $selection) {
            HomeFeedView().tabItem { Label("Home", systemImage: "house") }.tag(Tab.home)
            
            NewPostView().tabItem { Label("Post", systemImage:
                                            "plus.app")}.tag(Tab.post)
            
            ProfileView().tabItem { Label("Profile", systemImage:               "person") }.tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().bothColorSchemes()
    }
}
