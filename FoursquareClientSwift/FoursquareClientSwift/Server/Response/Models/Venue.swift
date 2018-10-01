//
//  Venue.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper

class Venue: Mappable {
    
    var id: String?
    var name: String?
    var location: Location?
    var categories: [Category]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["venue.id"]
        name <- map["venue.name"]
        location <- map["venue.location"]
        categories <- map["venue.categories"]
    }
}
