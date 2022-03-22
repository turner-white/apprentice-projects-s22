//
//  ContentView.swift
//  DayCounter
//
//  Created by Turner White on 3/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(vm.getNumDays())
                    .font(.custom("Large", size: 80))
                .padding()
                NavigationLink(destination: SettingsView(vm: vm)) {
                    Label("Settings", systemImage: "gearshape")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
