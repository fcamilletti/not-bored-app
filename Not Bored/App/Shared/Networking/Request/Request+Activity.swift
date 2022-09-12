//
//  Request+Activity.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation

extension Request.Activity {
    struct GetActivity : NetworkRequestTpe {
        
        let type : String?
        
        var request: RequestData {
            return RequestData(endpoint: "activity", method: .get, headers: [:] , parameters: [ "type" : type ] )
        }
    }
}
