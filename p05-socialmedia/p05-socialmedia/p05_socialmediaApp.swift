//
//  p05_socialmediaApp.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

@main
struct p05_socialmediaApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
