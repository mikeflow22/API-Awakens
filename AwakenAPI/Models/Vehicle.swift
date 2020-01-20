//
//  Vehicle.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct Vehicle: StarwarsEntity {
    let url: URL
    let name:  String
    let model: String
    let costInCredits: String
    let length: String
    let vehicleClass: String
    let crew: String
    
    static var path: String {
        return "vehicles"
    }
}
