//
//  MilesRanViewModel.swift
//  p07-runnyy
//
//  Created by Turner White on 3/21/22.
//

import Foundation

final class MilesRanViewModel: ObservableObject {
    @Published private(set) var milesRan: Double = 0.0
    @Published private(set) var isZeroMile: Bool = true
    
    init() {
        milesRan = MilesRanStore.fetchMiles()
    }
    
    
    func increment(amount: Double) -> Void {
        milesRan += amount
        MilesRanStore.saveMiles(miles: milesRan)
        isZeroMile = false
    }
    
    func decrement(amount: Double) -> Void {
        if milesRan < amount {
            milesRan = 0
        } else {
            milesRan -= amount
        }
        MilesRanStore.saveMiles(miles: milesRan)
        
        if milesRan == 0 {
            isZeroMile = true
        }
    }
}
