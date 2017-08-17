//
//  APIManager.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class APIManager: NSObject
{
    static func getTaxi(coordinate: CLLocationCoordinate2D, completion: @escaping(Any?) -> Void)
    {
        let url = Url.base.rawValue + UrlComplement.lat.rawValue + String(coordinate.latitude) + UrlComplement.long.rawValue + String(coordinate.longitude)
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                completion(JSON(data))
            }
            if let error = result as? Error
            {
                completion(error)
            }
        }
    }
}
