//
//  ActivityService.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation

final class ActivityService {
    
    static let shared = ActivityService()
    
    private init() {}
    
    func fetchActivities() -> [ActivityType] {
        return [ ActivityType(description: "education"),
                 ActivityType(description: "recreational"),
                 ActivityType(description: "social"),
                 ActivityType(description: "diy"),
                 ActivityType(description: "charity"),
                 ActivityType(description: "cooking"),
                 ActivityType(description: "relaxation"),
                 ActivityType(description: "music"),
                 ActivityType(description: "busywork")]
    }
}

