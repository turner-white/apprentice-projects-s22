//
//  p08_WeatheryApp.swift
//  p08-Weathery
//
//  Created by Turner White on 3/29/22.
//

import SwiftUI

@main
struct p08_WeatheryApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(vm: viewModel)
        }
    }
}
