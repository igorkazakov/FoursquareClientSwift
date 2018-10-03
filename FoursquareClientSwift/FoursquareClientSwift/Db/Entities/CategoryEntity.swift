//
//  CategoryEntity.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryEntity: Object {

    @objc dynamic var id: String? = nil
    @objc dynamic var pluralName: String? = nil
    @objc dynamic var icon: IconEntity? = nil
    @objc dynamic var primary = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
