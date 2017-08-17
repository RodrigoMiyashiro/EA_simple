//
//  ListTaxi.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListTaxi: NSObject
{
    var taxis: [Taxi]
    
    override init()
    {
        taxis = [Taxi]()
    }
    
    convenience init(dataJSON: JSON)
    {
        self.init()
        self.taxis = self.getListTaxi(jsonList: dataJSON["taxis"].arrayValue)
    }
    
    private func getListTaxi(jsonList: [JSON]) -> [Taxi]
    {
        var array = [Taxi]()
        for json in jsonList
        {
            let newTaxi = Taxi(dataJSON: json)
            array.append(newTaxi)
        }
        
        return array
    }
}
