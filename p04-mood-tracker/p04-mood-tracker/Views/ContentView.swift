//
//  ContentView.swift
//  p04-mood-tracker
//
//  Created by Samuel Shi on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MoodTrackerViewModel()
    var body: some View {
        
        VStack {
            HStack {
            TextField("How are you feeling?", text: $viewModel.newTitle )
                
                .textFieldStyle(.roundedBorder)
                //.background(.gray)
            Button {
                viewModel.createCheckIn(id: viewModel.checkIns.count, mood: viewModel.newTitle, timestamp: Date())
            } label: { Label("Save", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/).labelStyle(.titleOnly)}
            }
            .padding()
            List {
                ForEach(viewModel.checkIns) { check in
                    VStack(alignment: .leading) {
                        Text(check.mood)
                        Text(check.formattedTimestamp)
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
}
