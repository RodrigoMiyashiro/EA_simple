//
//  Request.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import Alamofire

class Request: NSObject
{
    static func getFrom(_ url: String, _ parameters: Dictionary<String, Any>? = nil, _ headers: [String:String]? = nil ,  completion: @escaping(Any?) -> Void) {
        
        Alamofire.request(url, method: .get, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<405)
            .responseJSON { (response) in
                print("request url: \(String(describing: response.request))")
                
                switch response.result {
                case .success:
                    completion(response.data)
                    break
                    
                case .failure(let error):
                    print(error)
                    completion(error)
                    break
                }
        }
    }
}
