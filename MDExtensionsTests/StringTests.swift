//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest
@testable import MDExtensions

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
    
    func testSubstringOperations() {
        let sourceString = "I ♡ Swift!"
        
        // substring from start index
        XCTAssertEqual(sourceString.substring(from: 0), "I ♡ Swift!")
        XCTAssertEqual(sourceString.substring(from: 4), "Swift!")
        
        // substring to end index
        XCTAssertEqual(sourceString.substring(to: sourceString.characters.count), "I ♡ Swift!")
        XCTAssertEqual(sourceString.substring(to: 4), "I ♡ ")
        
        // substring between indeces
        XCTAssertEqual(sourceString.substring(with: 0..<sourceString.characters.count), "I ♡ Swift!")
        XCTAssertEqual(sourceString.substring(with: 2..<3), "♡")
        
        // test complex characters
        XCTAssertEqual("Strings are 易 and 繁".substring(with:12..<19), "易 and 繁")
    }
}

class CharacterSetTests: XCTestCase {
    func testAllCharactersInCharacterSet() {
        let set = CharacterSet(charactersIn: "🚀")
        
        XCTAssertTrue(set.characters.contains("🚀"))
    }
}
