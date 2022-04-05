//
//  WeatherView.swift
//  p08-Weathery
//
//  Created by Turner White on 3/29/22.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var vm: WeatherViewModel
    
    var body: some View {
        VStack{
            Text(vm.cityName).font(.largeTitle)
                .padding()
            Text(vm.temp).font(.system(size: 70)).bold()
            Text(vm.weatherIcon).padding()
            Text(vm.weatherDesc)
            
        }.onAppear(perform: vm.refresh)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(vm: WeatherViewModel(weatherService: WeatherService()))
    }
}
