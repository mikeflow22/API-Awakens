//
//  Pageable.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

protocol Pageable: Codable {
    //this is similar to typea
    associatedtype Entity: StarwarsAPI
    
    var next: URL? { get }
    var previous: URL? { get }
    var count: Int { get }
    
    var results: [Entity] { get }
}
