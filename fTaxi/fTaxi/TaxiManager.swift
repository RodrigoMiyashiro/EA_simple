//
//  TaxiManager.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class TaxiManager: NSObject
{
    internal var list: ListTaxi
    
    override init()
    {
        self.list = ListTaxi()
    }
    
    func loadTaxiList(coordinate: CLLocationCoordinate2D, completion: @escaping () -> Void)
    {
        APIManager.getTaxi(coordinate: coordinate) { (result) in
            if let dataJSON = result as? JSON
            {
                self.list = ListTaxi(dataJSON: dataJSON)
            }
            if let error = result as? Error
            {
                print("-->> Error get Taxis: \(error)")
            }
            completion()
        }
    }
    
    
}
