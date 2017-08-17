//
//  TaxiTests.swift
//  fTaxi
//
//  Created by Rodrigo A E Miyashiro on 16/08/17.
//  Copyright © 2017 Rodrigo Miyashiro. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import fTaxi

class TaxiTests: XCTestCase {
    
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
    
    func testTaxiSimple()
    {
        let taxi = Taxi()
        XCTAssertTrue(taxi.driverName == "")
        XCTAssertTrue(taxi.driverCar == "")
        XCTAssertTrue(taxi.lat == 0.0)
        XCTAssertTrue(taxi.lng == 0.0)
    }
    
    func testTaxiJSON()
    {
        let json = JSON(dictionaryLiteral: [("driver-name", "abc"), ("driver-car", "car"), ("lat", -10.11), ("lng", -10.11)])
        let taxi = Taxi(dataJSON: json)
        XCTAssertTrue(taxi.driverName == "abc")
        XCTAssertTrue(taxi.driverCar == "car")
        XCTAssertTrue(taxi.lat == -10.11)
        XCTAssertTrue(taxi.lng == -10.11)
    }
}
