//
//  Model.swift
//  DayCounter
//
//  Created by Turner White on 3/1/22.
//

import Foundation
 
final class ModelData: ObservableObject {
    @Published var initialDate = Date()
    
    static let defaultModel = ModelData()
    //var timeInterval: TimeInterval = intitialDate.timeSinceNow()
    //var
}
