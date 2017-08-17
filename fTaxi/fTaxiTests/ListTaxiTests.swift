//
//  ListTaxiTests.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import fTaxi

class ListTaxiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testListTaxiSimple()
    {
        let listTaxi = ListTaxi()
        XCTAssertTrue(listTaxi.taxis.count == 0)
        
    }
    
    func testListTaxiJSON()
    {
        let taxi = JSON(dictionaryLiteral: [("driver-name", "abc"), ("driver-car", "car"), ("lat", -23.5810434255579), ("lng", -46.6153695646358)])
        let json = JSON(dictionaryLiteral: [("taxis", [taxi])])
        let listTaxi = ListTaxi(dataJSON: json)
        XCTAssertTrue(listTaxi.taxis.first?.driverName == "abc")
        XCTAssertTrue(listTaxi.taxis.first?.driverCar == "car")
        XCTAssertTrue(listTaxi.taxis.first?.lat == -23.5810434255579)
        XCTAssertTrue(listTaxi.taxis.first?.lng == -46.6153695646358)
    }
}
