//
//  ColorTests.swift
//  Extensions
//
//  Created by Michael Leber on 2/1/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest
@testable import Extensions
import UIKit
import CoreGraphics

class ColorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNullableIntiializer() {
        
        XCTAssertNil(UIColor(hexValue: ""))
        XCTAssertNil(UIColor(hexValue: "12345"))
        XCTAssertNil(UIColor(hexValue: "1234567"))
        XCTAssertNil(UIColor(hexValue: "123456789"))
    }

    //@TODO: need to check the color space... this is just for documentation purposes in case a user of the library is interested in knowing what colorspace this is creating colors in
//    func testHexFromStringCreatesRGBColorSpace() {
//        let color = UIColor(hexValue: "AABBCCFF")!
//        
//        
//        XCTAssertTrue(color.cgColor.colorSpace! === CGColorSpace(name: CGColorSpace.genericRGBLinear))
//    }
    
    
    func testWhiteHexStringProducesWhiteColor() {
        let color = UIColor(hexValue: "FFFFFF")!
        
        // Use array here as UIColor.white returns from a different space that only has one color (gray color space)
        XCTAssertEqual(color.cgColor.components!, [1.0, 1.0, 1.0, 1.0])
    }
    
    func testLeadingHashTagIsIgnored() {
        let color = UIColor(hexValue: "#AABBCC")
        
        XCTAssertNotNil(color)
    }

    
    func testSixHexAssumesOneAlpha() {
        let color = UIColor(hexValue: "123456")!
        
        XCTAssertEqual(color.cgColor.alpha, 1.0)
    }
    
    func testEightHexUsesAlpha() {
        // 80 is 50% of FF in HEX e.g. 50% alpha
        let color = UIColor(hexValue: "12345680")!
        
        XCTAssertEqualWithAccuracy(color.cgColor.alpha, 0.5, accuracy: 0.01)
    }
    
    func testSingleColors() {
        let redColor = UIColor(hexValue: "FF0000")!
        let greenColor = UIColor(hexValue: "00FF00")!
        let blueColor = UIColor(hexValue: "0000FF")!
    
        
        XCTAssertEqual(redColor.cgColor.components!, UIColor.red.cgColor.components!)
        XCTAssertEqual(greenColor.cgColor.components!, UIColor.green.cgColor.components!)
        XCTAssertEqual(blueColor.cgColor.components!, UIColor.blue.cgColor.components!)
    }
    
    func testHexStringWithOpacity() {
        XCTAssertEqual(UIColor(hexValue: "FFFFFF")!.cgColor.alpha, 1)
        XCTAssertEqual(UIColor(hexValue:"FFFFFF00")!.cgColor.alpha, 0)
    }
    
    func testRGBHex() {
        // Uses the hex value "0C5383" - this is some kind of blue
        let color = UIColor(rgbHex: 807811)
        
        // This is the same color above, but not using the hex int
        let comparedColor = UIColor(red: 12/255.0, green: 83/255.0, blue: 131/255.0, alpha: 1.0)
        
        XCTAssertEqual(color, comparedColor)
        
    }
}
