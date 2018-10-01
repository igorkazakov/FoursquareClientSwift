//
//  Icon.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper

class Icon: Mappable {
    
    var prefix: String?
    var suffix: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        prefix <- map["prefix"]
        suffix <- map["suffix"]
    }
}
