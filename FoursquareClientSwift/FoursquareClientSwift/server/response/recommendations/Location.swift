//
//  Location.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper

class Location: Mappable {
    
    var address: String?
    var lat: Double?
    var lng: Double?
    var distance: Int?
    var city: String?
    var state: String?
    var country: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        address <- map["address"]
        lat <- map["lat"]
        lng <- map["lng"]
        distance <- map["distance"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
    }
}

