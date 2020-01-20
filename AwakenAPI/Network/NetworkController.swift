//
//  NetworkController.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

//Enum for constant keys
struct Constants {
    static let people = "people"
    static let vehicles = "vehicles"
    static let starships = "starships"
}
//Generic Constraint: This allows us to
class NetworkController<T: StarwarsEntity> {
    
    //we will need to fetch all characters to populate the picker on the view
    ///This function will return all characters
    static func fetchAllEntity(completion: @escaping ([T]?, Error?) -> Void) {
        let baseURL = URL(string: "https://swapi.co/api/")!
        
        //construct the url to send in the request
        let url = baseURL.appendingPathComponent(T.path)
        print("This is the url for fetching all the \(T.path): \(url.description)")
        
        //because we are only GET-ing we don't  need to construct a urlRequest.
        //also because we are not adding any queryItems we dont need to construct a urlComponent object either
        
        NetworkManager.fetch(url: url) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(let data):
                
                //construct a decoder object to parse through the json. we want to get back an array of characters based on how we set up our model
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy =  .convertFromSnakeCase
                
                do {
                    //TopLevelDictionary struct has the results property in it that we need to drill down in the api
                    let arrayOfEntity = try decoder.decode(TopLevelDictionary<T>.self, from: data).results
                    
                    completion(arrayOfEntity, nil)
                } catch  {
                    print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
                    completion(nil, error)
                    return
                }
            }
        }
    }
}
