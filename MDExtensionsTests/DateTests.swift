//
//  DateTests.swift
//  Extensions
//
//  Created by Michael Leber on 2/16/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest

@testable import MDExtensions

class DateTests: XCTestCase {
    

    func testSimpleMSDateCases() {
        XCTAssertEqual(Date(MSDate: 0), Date(timeIntervalSince1970: -2209161600))
        XCTAssertEqual(Date(MSDate: 25568), Date(timeIntervalSince1970: -86400))
        XCTAssertEqual(Date(MSDate: 25569), Date(timeIntervalSince1970: 0))
        XCTAssertEqual(Date(MSDate: 25570), Date(timeIntervalSince1970: 86400))
    }
    
    func testFractionalMSDateCases() {
        XCTAssertEqual(Date(MSDate:25569.00001157407), Date(timeIntervalSince1970:1))
    }
    
}
