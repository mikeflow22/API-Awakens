//
//  Character.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct Character: StarwarsEntity {
    let url: URL
    let name: String
    let height: String
    let homeworld: URL
    let birthYear: String
    let eyeColor: String
    let hairColor: String
    
    static var path: String {
        return "people"
    }
}





























