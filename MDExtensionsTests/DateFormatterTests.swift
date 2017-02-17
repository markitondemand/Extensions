//  Copyright © 2017 Markit. All rights reserved.
//

import XCTest

@testable import MDExtensions

class DateFormatterTests: XCTestCase {
    
    func testFormatStringFromDate() {
        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyy"), "1984")
        
        let UTC = TimeZone(identifier: "UTC")!
        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyyZ", timeZone:UTC), "1984+0000")

        // Test uses local time zone as default
        let timezone = TimeZone.current.abbreviation()!
        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyyz"), "1984\(timezone)")

        XCTAssertEqual(DateFormatter.string(from:Date(timeIntervalSince1970: 441788400), format: "yyyy"), "1984")
    }
    
    func testDateFromFormatString() {
        XCTAssertEqual(DateFormatter.date(from: "1984", format:"yyyy"), Date(timeIntervalSince1970: 441788400))
    }
}
