//
//  ActivityViewModel.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation


class ActivityViewModel {
    
    private var service : ActivityService
    var activities : [ActivityType] = []
    
    public init(service : ActivityService){
        self.service = service
    }
    
    func getActivities() {
        self.activities = service.fetchActivities()
        selectActivity(type: "")
    }
    
    func selectActivity(type : String) {
        
        APIManager.Activity.getActivity(request: Request.Activity.GetActivity(), onResponse: { activity in
            print(activity,"hola")
        })
      
    }
    
}
