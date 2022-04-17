//
//  ContentView.swift
//  ex04-corelocation
//
//  Created by Samuel Shi on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManger = LocationManager()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Latitude: \(locationManger.latitude)")
            Text("Longitude: \(locationManger.longitude)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
