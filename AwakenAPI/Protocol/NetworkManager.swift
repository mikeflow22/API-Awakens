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
    static func fetch(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        fetch(urlRequest: request, completion: completion)
    }
    
    static func fetch(urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
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
