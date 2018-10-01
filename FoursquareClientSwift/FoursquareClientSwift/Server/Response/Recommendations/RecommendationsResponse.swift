//
//  RecommendationsResponse.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import ObjectMapper

class RecommendationsResponse: Mappable {
    
    var groups: [GroupItem]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        groups <- map["response.groups"]
    }
}
