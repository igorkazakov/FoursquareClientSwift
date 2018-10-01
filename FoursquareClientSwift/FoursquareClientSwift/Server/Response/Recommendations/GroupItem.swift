//
//  GroupItem.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper

class GroupItem: Mappable {
    
    var items: [Venue]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}
