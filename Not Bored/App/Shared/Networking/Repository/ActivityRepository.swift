//
//  ActivityRepository.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation
import Alamofire

extension APIManager.Activity {
    
    static func getActivity(request : Request.Activity.GetActivity , onResponse : @escaping (Activity) -> Void , onError : @escaping (Error) -> Void ) -> Void  {
        
        request.getRequest(element: Activity.self, onResult: { result in
            switch result {
            case .success(let data):
                onResponse(data)
            case .failure(let error):
                onError(error)
            }
        })
    }
}
