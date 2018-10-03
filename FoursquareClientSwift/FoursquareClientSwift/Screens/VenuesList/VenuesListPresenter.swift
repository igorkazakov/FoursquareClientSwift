//
//  VenuesListPresenter.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 28.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import RxSwift

class VenuesListPresenter: NSObject {
    
    private weak var view: VenuesListViewProtocol?
    private var repository: VenuesRepositoryProtocol?
    private let locationManager = CLLocationManager()
    private let distanseFilter = 500.0
    private let disposeBag = DisposeBag()
    private var venues = [Venue]()
    private var venueModels = [VenueViewModel]()
    
    init(view: VenuesListViewProtocol, repository: VenuesRepositoryProtocol) {
        super.init()
        self.view = view
        self.repository = repository
        self.initLocation()
    }
    
    // MARK: Private methods
    
    private func initLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = self.distanseFilter
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func loadVenuesWithLocation(_ location: String) {
        
        guard let repository = self.repository else { return }
        
        print("show loading")
        
        disposeBag.insert(repository.loadVenueRecommendationsWithLocation(location)
            .observeOn(MainScheduler.instance)
            .flatMap({ (venues) -> Observable<[VenueViewModel]> in
                
                self.venues = venues
                let viewModels = venues.map({ (item) -> VenueViewModel in
                    VenueViewModel(item)
                })
                
                return Observable.of(viewModels)
            })
            .subscribe(onNext: { (viewModels) in
                self.venueModels = viewModels
                self.view?.showVenues(viewModels)
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                print("hide loading")
            },
               onDisposed: {}))
    }
}

extension VenuesListPresenter: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude), \(locValue.longitude)")
        
        self.loadVenuesWithLocation("\(locValue.latitude), \(locValue.longitude)")
    }
}
