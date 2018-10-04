//
//  Icon.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import Realm

class Icon: Object, Mappable {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var prefix: String? = nil
    @objc dynamic var suffix: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        prefix <- map["prefix"]
        suffix <- map["suffix"]
    }
}
