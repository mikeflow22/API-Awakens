//
//  PagedResponse.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

//This model conforms to StarwarsAPI (and so does our concrete model types - which allows access the keys in each models json dictionary on the api)
//so people:  let results [Character]. This allows us to get to the results
struct PagedResponse<T: StarwarsAPI>: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [T]
}
