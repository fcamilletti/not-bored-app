//
//  Activity.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation

struct Activity : Decodable {
    let activity : String
    let type : String
    let accessibility : Double
    let participants : Int
    let price : Double
    
    var priceType : String {
        
        if price == 0 {
            return "Free"
        } else if price <= 0.3 {
            return "Low"
        } else if price <= 0.6 {
            return "Medium"
        } else {
            return "High"
        }
        
    }
}
