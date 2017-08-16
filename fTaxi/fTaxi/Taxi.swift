//
//  Taxi.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class Taxi: NSObject
{
    var driverName: String
    var driverCar: String
    var lat: CLLocationDegrees
    var lng: CLLocationDegrees
    
    override init()
    {
        driverName = ""
        driverCar = ""
        lat = 0
        lng = 0
    }
    
    init(dataJSON: JSON)
    {
        driverName = dataJSON["driver-name"].stringValue
        driverCar = dataJSON["driver-car"].stringValue
        lat = dataJSON["lat"].doubleValue
        lng = dataJSON["lng"].doubleValue
    }
}
