//
//  Category.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper

class Category: Mappable {
    
    var id: String?
    var pluralName: String?
    var icon: Icon?
    var primary: Bool?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        pluralName <- map["pluralName"]
        icon <- map["icon"]
        primary <- map["primary"]
    }
}
