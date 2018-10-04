//
//  VenuesDao.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 03.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxRealm

class VenuesDao: NSObject {

    static func saveVenues(_ models: [Venue]) {
        
        let realm = try! Realm()
        try! realm.write({
            realm.add(models, update: true)
        })
    }
    
    static func fetchVenues() -> Observable<Array<Venue>> {
        
        let realm = try! Realm()
        let laps = realm.objects(Venue.self)
        
        return Observable.array(from: laps)
    }
}
