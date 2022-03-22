//
//  MilesRanStore.swift
//  p07-runnyy
//
//  Created by Turner White on 3/21/22.
//

import Foundation
import WidgetKit

struct MilesRanStore {
    static private let defaults = UserDefaults(suiteName: "turner-white")!
    //static let userDefaults = UserDefaults.standard
    static let milesKey = "miles"
    
    static func save(miles: Double) {
        defaults.set(miles, forKey: milesKey)
        WidgetCenter.shared.reloadAllTimelines()
        WidgetCenter.shared.reloadTimelines(ofKind: "runWidget")
    }
    
    static func fetchMiles() -> Double{
        return defaults.double(forKey: milesKey)
    }
}
