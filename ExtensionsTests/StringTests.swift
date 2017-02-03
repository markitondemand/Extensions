//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest
@testable import Extensions

class StringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testURLEncoding() {
        XCTAssertEqual("value".stringByEncodingForURLQuery(), "value")
        XCTAssertEqual("?".stringByEncodingForURLQuery(), "?")
        XCTAssertEqual("/".stringByEncodingForURLQuery(), "/")
        XCTAssertEqual("{}".stringByEncodingForURLQuery(), "%7B%7D")
    }
}

class CharacterSetTests: XCTestCase {
    func testPrintCharacterSet() {
        let set = CharacterSet(charactersIn: "🚀")
        
        XCTAssertTrue(set.characters.contains("🚀"))
    }
}
