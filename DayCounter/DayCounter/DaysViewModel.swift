//
//  DaysViewModel.swift
//  DayCounter
//
//  Created by Turner White on 3/22/22.
//

import Foundation

class DaysViewModel: ObservableObject {
    @Published var dateFromPicker: Date = Date()
    @Published var updateFlag = true
    
    func update() {
        DaysStore.saveInterval(interval: dateFromPicker.timeIntervalSinceNow)
        updateFlag.toggle()
    }
    
    func fetchDays() -> String {
        return "\(DaysStore.fetchCalculatedDays())"
    }
}
