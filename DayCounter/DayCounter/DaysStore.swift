//
//  DaysStore.swift
//  DayCounter
//
//  Created by Turner White on 3/22/22.
//

import Foundation
import WidgetKit

struct DaysStore {
    static private let defaults = UserDefaults(suiteName: "group.com.turner-white.DayCounter.contents")!
    static let intervalKey = "interval"
    
    static func saveInterval(interval: Double) {
        defaults.set(interval, forKey: intervalKey)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    static func fetchInterval() -> Double {
        let bruh = defaults.double(forKey: intervalKey)
        return bruh
    }
    
    static func fetchCalculatedDays() -> String {
        return "\(Int(floor((fetchInterval() / -3600) / 24)))"
    }
}
