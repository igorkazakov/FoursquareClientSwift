//
//  Repository+Map.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 03.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import Foundation
import RxSwift

protocol MapRepositoryProtocol {
    
    func getVenues() -> Observable<Array<Venue>>
}

extension Repository: MapRepositoryProtocol {

    func getVenues() -> Observable<Array<Venue>> {
        
        return VenuesDao.fetchVenues()
    }
}
