//
//  WeatherService.swift
//  p08-Weathery
//
//  Created by Turner White on 3/29/22.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject {
    
    private let locationManager = CLLocationManager()
    private let apiKey = "975f08a3ad766a9e95a80cefda670f1e"
    private var completionHandler: ((Weather) -> Void)?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func loadWeatherData(_ completionHandler: @escaping ((Weather) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API Key}
    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString =
                "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)&units=metric"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        print(urlString)
        guard let url = URL(string: urlString) else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            print("urlGetSuccess")
            print(String(decoding: data, as: UTF8.self))
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                print("Date requested")
                self.completionHandler?(Weather(response: response))
            }
            print("fell through")
            
        }.resume()
        
    }
}
extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        makeDataRequest(forCoordinates: location.coordinate)
    }
    public func locationManager( _ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong: \(error.localizedDescription)")
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
    
}
struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
