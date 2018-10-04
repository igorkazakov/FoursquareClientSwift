//
//  Category.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import Realm

class Category: Object, Mappable {
    
    @objc dynamic var id = ""
    @objc dynamic var pluralName: String? = nil
    @objc dynamic var icon: Icon? = nil
    @objc dynamic var primary = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        pluralName <- map["pluralName"]
        icon <- map["icon"]
        primary <- map["primary"]
    }
}
