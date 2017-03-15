//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest
@testable import MDExtensions

class DictionaryTests: XCTestCase {
    func testPlusEqualOperation() {
        var sourceDictionary = ["A":1, "B":2]
        let addedDictionary = ["C":3]
        
        sourceDictionary += addedDictionary
        
        XCTAssertEqual(sourceDictionary["C"], 3)
    }
    
    func testPlusOperation() {
        let dict1 = ["A":1]
        let dict2 = ["B":2]
        
        let combinedDict = dict1 + dict2
        
        XCTAssertEqual(combinedDict, ["A":1, "B":2])
    }
}
