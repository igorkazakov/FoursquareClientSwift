//
//  LocationEntity.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RealmSwift

class LocationEntity: Object {

    @objc dynamic var id: Int64 = 0
    @objc dynamic var address: String? = nil
    @objc dynamic var lat: Double? = nil
    @objc dynamic var lng: Double? = nil
    @objc dynamic var distance: Int? = nil
    @objc dynamic var city: String? = nil
    @objc dynamic var state: String? = nil
    @objc dynamic var country: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(LocationEntity.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
