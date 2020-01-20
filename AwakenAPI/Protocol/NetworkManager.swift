//
//  NetworkManager.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

//urlsession wrapper
struct NetworkManager {
    private static let session = URLSession(configuration: .default)
    
    static func fetch(endpoint: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        fetch(url: endpoint, completion: completion)
    }
    
    static func fetch(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
