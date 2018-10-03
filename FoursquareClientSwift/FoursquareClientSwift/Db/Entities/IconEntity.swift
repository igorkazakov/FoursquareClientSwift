//
//  IconEntity.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RealmSwift

class IconEntity: Object {

    @objc dynamic var id: Int64 = 0
    @objc dynamic var prefix: String? = nil
    @objc dynamic var suffix: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(IconEntity.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}
