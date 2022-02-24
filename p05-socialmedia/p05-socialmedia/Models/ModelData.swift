//
//  ModelData.swift
//  p05-socialmedia
//
//  Created by Turner White on 2/23/22.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var showingLogIn: Bool = true
    @Published var profile: Profile = Profile.defaultProfile
}
