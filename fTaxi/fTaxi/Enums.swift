//
//  Enums.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

enum Url: String
{
    case base = "http://quasinada-ryu.easytaxi.net.br/api/gettaxis"
}

enum UrlComplement: String
{
    case lat = "?lat="
    case long = "&lng="
}
