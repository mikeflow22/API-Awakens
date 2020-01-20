//
//  PagedResponse.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct PagedResponse<T: StarwarsAPI>: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [T]
}
