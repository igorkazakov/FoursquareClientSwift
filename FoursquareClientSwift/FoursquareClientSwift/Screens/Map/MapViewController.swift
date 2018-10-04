//
//  MapViewController.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 02.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapViewProtocol: class {
    
    func showVenues(_ annotations: [VenueAnnotation])
    func initMap()
    func showMyLocation()
}

class MapViewController: UIViewController, MapViewProtocol {
    
    private var presenter: MapPresenter?
    private var annotations = [VenueAnnotation]()
    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MapPresenter(view: self, repository: Repository.shared)
    }
    
    func showVenues(_ annotations: [VenueAnnotation]) {
        self.mapView.removeAnnotations(self.annotations)
        self.annotations = annotations
        self.mapView.addAnnotations(annotations)
        self.fitAll()
    }
    
    func initMap() {
        self.mapView.mapType = .standard
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
    }
    
    func showMyLocation() {
        if let coor = self.mapView.userLocation.location?.coordinate {
            self.mapView.setCenter(coor, animated: true)
        }
    }
    
    private func fitAll() {
        var zoomRect = MKMapRectNull;
        for annotation in self.annotations {
            let annotationPoint = MKMapPointForCoordinate(annotation.coordinate)
            let pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.01, 0.01);
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
        self.mapView.setVisibleMapRect(zoomRect,
                                       edgePadding: UIEdgeInsetsMake(50, 50, 50, 50),
                                       animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var view: MKMarkerAnnotationView
        
        if let annotation = annotation as? VenueAnnotation  {
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: VenueAnnotation.identifier)
                as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: VenueAnnotation.identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            
        } else {
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: VenueAnnotation.identifier)
                as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "VenueAnnotation.identifier")
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
        }
        
        return view
    }
}

