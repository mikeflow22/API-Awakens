//
//  Character.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct Character: StarwarsEntity {
    var films: [URL]
    var url: URL
    let name: String
    let height: String
    let homeworld: URL
    let birthYear: String
    let eyeColor: String
    let hairColor: String
    
    var heightConversion: String {
        if let heightDouble = Double(height)  {
            return String(heightDouble / 2.54 )
        }
        return height
    }
    
    static var path: String {
        return "people"
    }
}





























