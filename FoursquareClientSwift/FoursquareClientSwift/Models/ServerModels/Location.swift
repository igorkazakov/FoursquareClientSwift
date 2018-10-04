//
//  Location.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import Realm

class Location: Object, Mappable {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var address: String? = nil
    @objc dynamic var lat = 0.0
    @objc dynamic var lng = 0.0
    @objc dynamic var distance = 0
    @objc dynamic var city: String? = nil
    @objc dynamic var state: String? = nil
    @objc dynamic var country: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
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

