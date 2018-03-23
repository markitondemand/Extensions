//
//  NotificationHandleTests.swift
//  MDExtensionsTests
//
//  Created by Michael Leber on 3/23/18.
//  Copyright © 2018 Markit. All rights reserved.
//

import XCTest
@testable import MDExtensions

extension Notification.Name {
    static let TestNotification = Notification.Name("TestNotification")
}

class NotificationHandleTests: XCTestCase {
    func testNotificationHandleReportsOnNotification() {
        let _ = Notification.Name.TestNotification.handle {
            XCTAssertEqual($0.name, Notification.Name.TestNotification)
        }
        
        NotificationCenter.default.post(name: .TestNotification, object: nil)
    }
    
    // TODO: tests for passing different params when creating the handle
    // Test for filter object
    // Maybe test for different operation queue
}
