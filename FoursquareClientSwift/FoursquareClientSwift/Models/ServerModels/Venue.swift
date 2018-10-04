//
//  Venue.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import Realm

class Venue: Object, Mappable {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String? = nil
    @objc dynamic var location: Location? = nil
    var categories = List<Category>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["venue.id"]
        name <- map["venue.name"]
        location <- map["venue.location"]
        categories <- map["venue.categories"]
    }
}
