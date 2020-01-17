//
//  Character.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct Character: Codable {
    let name: String
    let height: Int
    
    /*
     The following are representations of snake_case on the api. Here we have to be sure to capitalize the word after the "_" so that the compiler will know its the begining of the second word.
     
     -- We dont have to use a customized init decoder method for snake_case if we make the decoder keyDecodingStrategy =  .convertFromSnakeCase
     */
    
    let birthYear: String
    let eyeColor: String
    let hairColor: String
}





























