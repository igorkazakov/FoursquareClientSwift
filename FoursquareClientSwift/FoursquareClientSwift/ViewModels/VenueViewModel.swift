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
    var location: Location?
    var categories: [Category]?
    
    init(_ model: Venue) {
        
        self.id = model.id
        self.name = model.name
        self.location = model.location
        self.categories = model.categories
    }
}
