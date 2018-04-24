//
//  InterfaceController.swift
//  OutrunnerWatch Extension
//
//  Created by Tony on 4/23/18.
//  Copyright © 2018 Tony Rivera. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var odometerLabel: WKInterfaceLabel!
    var gps = GPS()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        gps.startGPS()
        gps.gpsDelegate = self as GPSDelegate
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

extension InterfaceController: GPSDelegate {
    func odometer(speed: Double) {
        odometerLabel.setText(String(format: "%.0f",(speed * 2.23694)))
    }

}
