//
//  GPS.swift
//  Outrunner
//
//  Created by Tony on 4/23/18.
//  Copyright © 2018 Tony Rivera. All rights reserved.
//

import CoreLocation

class GPS: NSObject, CLLocationManagerDelegate {
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    func startGPS() {
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locationManager.location!.speed)
    }
}
