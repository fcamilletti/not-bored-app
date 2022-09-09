//
//  ActivityRepository.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation
import Alamofire

extension APIManager.Activity {
    
    static func getActivity(request : Request.Activity.GetActivity , onResponse : @escaping (Activity) -> Void ) -> Void  {
        
        request.getRequest(onResult: { result in
            switch result {
            case .success(let data):
                print(data)
                do {
                    guard let data = data as? Dictionary<String,Any> else { throw NetworkingError.error }
                    
                    let json = try JSONSerialization.data(withJSONObject: data )
                    let response = try JSONDecoder().decode(Activity.self, from: json)
                    
                    onResponse(response)
                } catch {
                    
                }
                
                break
            case .failure( let error):
                print(error)
                break
            }
        })
        
    }
}
