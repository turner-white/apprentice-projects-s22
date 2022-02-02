//
//  MoodTrackerViewModel.swift
//  p04-mood-tracker
//
//  Created by Turner White on 2/1/22.
//

import Foundation

final class MoodTrackerViewModel: ObservableObject {
    @Published var checkIns: [MoodCheckIn] = []
    @Published var newTitle: String = ""
    
    func createCheckIn(id: Int, mood: String, timestamp: Date) {
        let mood = MoodCheckIn(id: id, mood: newTitle, timestamp: timestamp)
        checkIns.append(mood)
    }
}
