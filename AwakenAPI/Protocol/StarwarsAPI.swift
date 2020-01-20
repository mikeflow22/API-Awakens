//
//  StarwarsAPI.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

protocol StarwarsAPI: Codable {
    var name: String { get }
    var films: [URL] { get }
    var url:  URL { get }
    static var path: URL { get }
}
