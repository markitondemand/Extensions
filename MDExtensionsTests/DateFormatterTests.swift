//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest

@testable import MDExtensions

class DateFormatterTests: XCTestCase {
    
    func testFormatStringFromDate() {
        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyy"), "1984")
        
        let UTC = TimeZone(identifier: "UTC")!
        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyyZ", timeZone:UTC), "1984+0000")

        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyy"), "1984")
    }
    
    func testDateFromFormatString() {
        XCTAssertEqual(DateFormatter.date(from: "1984", format:"yyyy"), Date(timeIntervalSince1970: 441788400))
    }
}
