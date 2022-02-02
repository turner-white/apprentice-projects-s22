//
//  MoodCheckIn.swift
//  p04-mood-tracker
//
//  Created by Turner White on 2/1/22.
//

import Foundation

struct MoodCheckIn: Identifiable {
    var id: Int
    var mood: String
    var timestamp: Date
    
    var formattedTimestamp: String {
        let formatter = DateFormatter()
        
        return formatter.string(from: timestamp)
    }
    
    
}

