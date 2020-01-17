//
//  NetworkRequest.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/17/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation
//MARK: - QUESTION why am I making this Codable?

protocol NetworkRequest: Codable {
    //in order to make a network request types that conform to this must have a path
    static var path: String { get }
}

extension NetworkRequest {
    //explicitly declare the base url for the network request
    static var baseURL: URL? {
        return URL(string: "https://swapi.co.api/")
    }
}
