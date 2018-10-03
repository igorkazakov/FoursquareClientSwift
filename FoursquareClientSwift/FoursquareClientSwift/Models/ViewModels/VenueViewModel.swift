//
//  VenueViewModel.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 01.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit

class VenueViewModel: NSObject {
    
    var id: String?
    var name: String?
    var distance: String?
    var address: String?
    var category: String?
    
    init(_ model: Venue) {
        
        self.name = model.name
        self.distance = "Где то недалеко"
        
        if let distance = model.location?.distance {
            self.distance = "В радиусе \(distance) метров"
        }
        
        if let city = model.location?.city {
            self.address = city
        }
        
        if let address = model.location?.address {
            self.address?.append(" \(address)")
        }
        
        self.category = model.categories?.first?.pluralName ?? "Без категории"
        self.id = model.id
    }
}
