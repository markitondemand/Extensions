//
//  TimeIntervalTests.swift
//  Extensions
//
//  Created by Michael Leber on 5/19/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest

class TimeIntervalTests: XCTestCase {
    
    func testTimeInterValFromMinutes() {
        XCTAssertEqual(600.0 as TimeInterval, TimeInterval(minutes: 10))
    }
    
    func testTimeIntervalFromHours() {
        XCTAssertEqual(3600.0 as TimeInterval, TimeInterval(hours: 1))
    }
    
    func testTimeIntervalFromDays() {
        XCTAssertEqual(86400.0 as TimeInterval, TimeInterval(days: 1))
    }
}
