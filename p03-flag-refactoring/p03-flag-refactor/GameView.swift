//
//  GameView.swift
//  GuessTheFlag
//
//  Created by hawkeyeshi on 6/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @State private var countries = CountryList.countries.shuffled().prefix(3)
    @State private var correctAnswerIndex = Int.random(in: 0...2)
    @State private var score = 0

    @State private var showingAlert = false
    @State private var alertTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tap the flag of")
                    
                Text(targetCountry.name)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
                Text("Score: \(score)")

                Spacer()
                    
                ForEach(countries, id: \.id) { country in
                    Button(action: {
                        if country == targetCountry {
                            alertTitle = "Correct"
                            score += 1
                        } else {
                            alertTitle = "Wrong! Thats the flag of \(country)"
                        }
                        
                        showingAlert = true
                    }) {
                        FlagImage(imageName: country.name)
                    }
                }
                    
                Spacer()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle),
                      message: Text("Your Score is \(score)"),
                      dismissButton: .default(Text("Continue")) {
                          countries = CountryList.countries.shuffled().prefix(3)
                          correctAnswerIndex = Int.random(in: 0...2)
                      })
            }
        }
        .preferredColorScheme(.dark)
    }
    
    var targetCountry: Country {
        return countries[correctAnswerIndex]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
