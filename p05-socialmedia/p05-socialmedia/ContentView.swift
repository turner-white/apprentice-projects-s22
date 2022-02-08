//
//  ContentView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    enum Tab {
        case home
        case profile
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeFeedView().tabItem { Label("Home", systemImage: "house") }.tag(Tab.home)
            
            ProfileView().tabItem { Label("Profile", systemImage: "person") }.tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().bothColorSchemes()
    }
}
