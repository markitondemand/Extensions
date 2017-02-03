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
        XCTAssertEqual(UIColor(hexValue: "FFFFFF00")!.cgColor.alpha, 0)
    }
    
    func testCreateColorFromRGBHex() {
        // Uses the hex value "0C5383" - this is some kind of blue
        let color = UIColor(rgbHex: 807811)
        
        // This is the same color above, but not using the hex int
        let comparedColor = UIColor(red: 12/255.0, green: 83/255.0, blue: 131/255.0, alpha: 1.0)
        
        XCTAssertEqual(color, comparedColor)
        
    }
    
    func testGetIndividualColorValues() {
        let color = UIColor(red: 0.25, green: 0.5, blue: 0.75, alpha: 1.0)
        XCTAssertEqualWithAccuracy(0.25, color.redValue!, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(0.5, color.greenValue!, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(0.75, color.blueValue!, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(1.0, color.alphaValue!, accuracy: 0.01)
        
        let whiteColor = UIColor.white
        XCTAssertEqualWithAccuracy(1.0, whiteColor.redValue!, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(1.0, whiteColor.greenValue!, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(1.0, whiteColor.blueValue!, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(1.0, whiteColor.alphaValue!, accuracy: 0.01)
    }
    
    func testGetHexValues() {
        let hexNumber = 123456
        let color = UIColor(rgbHex: hexNumber)
        
        XCTAssertEqual(color.rgbHex, hexNumber)
        
        let white = UIColor.white
        
        XCTAssertEqual(white.rgbHex, 16777215)
    }
    
    
    func testColorToHexString() {
        let color = UIColor.black
        XCTAssertEqual(color.hexString, "000000")
        
        let complexColor = UIColor(hexValue: "123456")!
        XCTAssertEqual(complexColor.hexString, "123456")
    }
}
