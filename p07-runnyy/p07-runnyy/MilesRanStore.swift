//
//  MilesRanStore.swift
//  p07-runnyy
//
//  Created by Turner White on 3/21/22.
//

import Foundation
import WidgetKit

struct MilesRanStore {
    static private let defaults = UserDefaults(suiteName:"group.com.turner-white.p07-runnyy.contents")!
    //static let userDefaults = UserDefaults.standard
    static let milesKey = "miles"
    
    static func saveMiles(miles: Double) {
        defaults.set(miles, forKey: milesKey)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    static func fetchMiles() -> Double{
        return defaults.double(forKey: milesKey)
    }
}
