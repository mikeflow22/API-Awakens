//
//  HomeworldManager.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct HomeworldManager {
    
    static func fetchHomeworldForCharacter(_ character: Character, completion: @escaping (Result<Homeworld, Error>)-> Void) {
        NetworkManager.fetch(url: character.homeworld) { (result) in
            if let data = try? result.get() {
                let decoder = JSONDecoder()
                do {
                    let homeworld = try decoder.decode(Homeworld.self, from: data)
                    completion(.success(homeworld))
                } catch  {
                    print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                    completion(.failure(error))
                }
            } else {
                print("Error in file: \(#file), in the body of the function: \(#function) on line: \(#line)\n")
            }
        }
    }
}
