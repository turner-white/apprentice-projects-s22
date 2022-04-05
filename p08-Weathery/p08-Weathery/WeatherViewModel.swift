//
//  WeatherViewModel.swift
//  p08-Weathery
//
//  Created by Turner White on 4/5/22.
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain" : "🌧",
    "Snow" : "🌨",
    "Clear" : "☀️",
    "Clouds": "☁️"]

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "cityname"
    @Published var temp: String = "--"
    @Published var weatherDesc: String = "--"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temp = weather.temperature
                self.weatherDesc = weather.description
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
