//
//  GPS.swift
//  Outrunner
//
//  Created by Tony on 4/23/18.
//  Copyright © 2018 Tony Rivera. All rights reserved.
//

import CoreLocation

protocol GPSDelegate {
    func odometer(speed: Double)
}

class GPS: NSObject, CLLocationManagerDelegate {
    
    var gpsDelegate: GPSDelegate!
    let locationManager: CLLocationManager = CLLocationManager()
    
    func startGPS() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locationManager.location!.speed)
        gpsDelegate.odometer(speed: locationManager.location!.speed)
    }
}
