//
//  MilesRanStore.swift
//  p07-runny
//
//  Created by Turner White on 3/8/22.
//

import Foundation

struct MilesRanStore {
    static let userDefaults = UserDefaults.standard
    static let milesKey = "miles"
    
    static func save(miles: Double) {
        userDefaults.set(miles, forKey: milesKey)
    }
    
    static func fetchMiles() -> Double{
        return userDefaults.double(forKey: milesKey)
    }
}
