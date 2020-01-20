//
//  NetworkManager.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

//urlsession wrapper - making this a struct so we don't have to initialize an instance of networkController just to make a network call everytime we want to make a network call
struct NetworkManager {
    private static let session = URLSession(configuration: .default)
    
    //result is apple's thing, this way we dont have to pass in nil
    //This function takes a url, constructs a URLRequest with it, then calls the function that ultimately makes the networking call
    static func fetch(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        fetch(urlRequest: request, completion: completion)
    }
    
    //This function will take in a urlRequest and make the network call
    static func fetch(urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        //because we are only GET-ing we don't  need to construct a urlRequest. 
        //also because we are not adding any queryItems we dont need to construct a urlComponent object either
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
