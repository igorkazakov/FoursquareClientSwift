//
//  VenueEntity.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RealmSwift

class VenueEntity: Object {
    @objc dynamic var id: String? = nil
    @objc dynamic var name: String? = nil
    @objc dynamic var location: LocationEntity? = nil
    let categories: List<CategoryEntity>? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
