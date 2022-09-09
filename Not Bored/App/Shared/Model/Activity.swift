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
}
