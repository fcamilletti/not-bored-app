//
//  SuggestViewModel.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 12/09/2022.
//

import Foundation


protocol SuggestViewModelDelegate {
    func getActivity( activity : Activity )
    func handleError(error : Error)
}


class SuggestViewModel {
    
    private var service : ActivityService
    var activities : [ActivityType] = []
    var delegate : SuggestViewModelDelegate?
    
    public init(on : SuggestViewModelDelegate , service : ActivityService){
        self.service = service
        self.delegate = on
    }
    
    func getActivities() {
        self.activities = service.fetchActivities()
        getActivity(type: "")
    }
    
    func getActivity(type : String?) {
        
        APIManager.Activity.getActivity(request: Request.Activity.GetActivity(type: type ), onResponse: { [weak self] activity in
            self?.delegate?.getActivity(activity: activity)
        }, onError: { [weak self] error in
            self?.delegate?.handleError(error: error)
        })
      
    }
    
}
