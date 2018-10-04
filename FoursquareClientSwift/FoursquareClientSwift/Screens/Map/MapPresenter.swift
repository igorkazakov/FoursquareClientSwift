//
//  MapPresenter.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RxSwift
import MapKit
import CoreLocation

class MapPresenter: NSObject, CLLocationManagerDelegate {

    private weak var view: MapViewProtocol?
    private var repository: MapRepositoryProtocol?
    private let disposeBag = DisposeBag()
    private var myLocationAnnotation: VenueAnnotation?
    private var annotations = [VenueAnnotation]()
    private let locationManager = CLLocationManager()
    
    init(view: MapViewProtocol, repository: MapRepositoryProtocol) {
        super.init()
        self.view = view
        self.repository = repository
        self.initLocation()
        self.showMyLocation()
        self.fetchVenues()
    }
    
    private func initLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.distanceFilter = 400
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
        
        self.view?.initMap()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let annotation = VenueAnnotation(title: "My location", coordinate: locValue)
        self.myLocationAnnotation = annotation
        self.locationManager.stopUpdatingLocation()
    }
    
    func showMyLocation() {
        self.locationManager.startUpdatingLocation()
        self.view?.showMyLocation()
    }
    
    func fetchVenues() {
        
        guard let repository = self.repository else { return }
        print("show loading")
        
        disposeBag.insert(repository.getVenues()
            .flatMap({ (venues) -> Observable<[VenueAnnotation]> in
            
            let annotations = venues.map({ (item) -> VenueAnnotation in
                return VenueAnnotation(venue: item)
            })
            
            return Observable.of(annotations)
            
        }).subscribe(onNext: { (annotations) in
            
            self.annotations = annotations
            if let myLocation = self.myLocationAnnotation {
                self.annotations.append(myLocation)
            }
            self.view?.showVenues(annotations)
        }, onError: { (error) in
            
        }, onCompleted: {
             print("hide loading")
        }, onDisposed: {}))
    }
}
