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
    let oneMSDateSecond: Double = 1/86400

    func testSimpleMSDateCases() {
        XCTAssertEqual(Date(MSDate: 0), Date(timeIntervalSince1970: -2209161600))
        XCTAssertEqual(Date(MSDate: 25568), Date(timeIntervalSince1970: -86400))
        XCTAssertEqual(Date(MSDate: 25569), Date(timeIntervalSince1970: 0))
        XCTAssertEqual(Date(MSDate: 25570), Date(timeIntervalSince1970: 86400))
    }
    
    func testFractionalMSDateCases() {
        // 1  second after 0 unix date
        let oneDayPlusOneSecond: Double = 25569+oneMSDateSecond
        XCTAssertEqual(Date(MSDate:oneDayPlusOneSecond).timeIntervalSince1970, Date(timeIntervalSince1970:1).timeIntervalSince1970, accuracy: 0.000001)
        XCTAssertEqual(Date(MSDate:25569.5), Date(timeIntervalSince1970: 43200))
        XCTAssertEqual(Date(MSDate:25569.25), Date(timeIntervalSince1970: 21600))
    }
    
    func testConvertToMSDate() {
        XCTAssertEqual(Date(timeIntervalSince1970: 0).MSDate, 25569)
        XCTAssertEqual(Date(timeIntervalSince1970: 43200).MSDate, 25569.5)
        XCTAssertEqual(Date(timeIntervalSince1970: 1).MSDate, 25569 + oneMSDateSecond, accuracy: 0.000001)
        
    }
}
