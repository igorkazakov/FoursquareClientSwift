//
//  VenueAnnotation.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import MapKit

class VenueAnnotation: NSObject, MKAnnotation {

    static let identifier = "VenueAnnotation"
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
    
    convenience init(venue: Venue) {
        let latitude = venue.location?.lat ?? 0.0
        let longitude = venue.location?.lng ?? 0.0
        let name = venue.name ?? "Venue"
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.init(title: name, coordinate: coordinate)
    }
}
