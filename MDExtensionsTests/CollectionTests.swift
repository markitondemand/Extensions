//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest
@testable import MDExtensions

class CollectionTests: XCTestCase {
    
    func testSafeSubscript() {
        let arr = ["alpha", "bravo", "charlie"]
        
        XCTAssertNil(arr[safe: 3])
        XCTAssertEqual(arr[safe: 0], "alpha")
    }
}
