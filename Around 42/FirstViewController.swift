//
//  FirstViewController.swift
//  Around 42
//
//  Created by Adrien Sleewaegen on 20/12/14.
//  Copyright (c) 2014 42. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapType: UISegmentedControl!
    @IBOutlet weak var mapLocation: UIButton!
    var locationManager: CLLocationManager!
    
    @IBAction func modeMap(sender: AnyObject) {
        if mapType.selectedSegmentIndex == 0
        {
            mapView.mapType = MKMapType.Standard
        }
        else if mapType.selectedSegmentIndex == 1
        {
            mapView.mapType = MKMapType.Satellite
        }
        else if mapType.selectedSegmentIndex == 2
        {
            mapView.mapType = MKMapType.Hybrid
        }
    }
    
    @IBAction func findMyLocation(sender: UIButton) {
//        println("test")
//        mapView.showUserLocation = true
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //        println("\(locations.last)")
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        //        locationManager.startUpdatingLocation()
        println("Change authorization")
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError
        error: NSError!) {
            println("Error while updating location " + error.localizedDescription);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(
            latitude: 48.8965899,
            longitude: 2.3185
        )
        
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "42"
        annotation.subtitle = "Don't Panic"
        mapView.addAnnotation(annotation)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.desiredAccuracy = kCLDistanceFilterNone
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
//            
//            if (error != nil) {
//                println("Reverse geocoder failed with error" + error.localizedDescription)
//                return
//            }
//            
//            if placemarks.count > 0 {
//                let pm = placemarks[0] as CLPlacemark
//                self.displayLocationInfo(pm)
//            } else {
//                println("Problem with the data received from geocoder")
//            }
//        })
//    }
//    
//    func displayLocationInfo(placemark: CLPlacemark?) {
//        if let containsPlacemark = placemark {
//            locationManager.stopUpdatingLocation()
//            var annotation2 = MKPointAnnotation()
//            mapView.removeAnnotations(mapView.annotations)
//            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
//            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
//            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
//            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
//            println(locality)
//            println(postalCode)
//            println(administrativeArea)
//            println(country)
//            var centerLocation2 = CLLocationCoordinate2DMake(containsPlacemark.location.coordinate.latitude, containsPlacemark.location.coordinate.longitude)
//            
//            var mapSpan2 = MKCoordinateSpanMake(0.003, 0.003)
//            
//            var mapRegion2 = MKCoordinateRegionMake(centerLocation2, mapSpan2)
//            
//            self.mapView.setRegion(mapRegion2, animated: true)
//            
//            annotation2.coordinate = centerLocation2
//            annotation2.title = locality
//            annotation2.subtitle = postalCode + " " + administrativeArea + " " + country
//            self.mapView.addAnnotation(annotation2)
//        }
//    }
//    
    
//    
//    @IBAction func findMyLocation(sender: UIButton) {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//    }


}

