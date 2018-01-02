//
//  EnumPrintableTests.swift
//  Extensions
//
//  Created by Michael Leber on 7/31/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest
@testable import MDExtensions

class EnumPrintableTests: XCTestCase {
    
    private  enum One: Int, EnumPrintable {
        case one
    }
    
    private enum Car: EnumPrintable {
        case ford
        case chrysler
        case gm
    }
    
    func testPrintEntriesOfEmptyEnum() {
        XCTAssertEqual(One.countOfCases, 1)
    }
    
    func testMultipleCountEnum() {
        XCTAssertEqual(Car.countOfCases, 3)
    }
}

