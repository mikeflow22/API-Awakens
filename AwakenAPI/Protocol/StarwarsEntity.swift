//
//  StarwarsAPI.swift
//  AwakenAPI
//
//  Created by Michael Flowers on 1/20/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

//All conctrete types share the same properties, the url and path help construct the url for the network call
protocol StarwarsEntity: Codable {
    var name: String { get }
    var url:  URL { get }
    static var path: String { get }
}
