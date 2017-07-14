//
//  TimeInterval.swift
//  Extensions
//
//  Created by Michael Leber on 5/18/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation


// MARK: - Initializers from time
extension TimeInterval {
    
    /// Initializes a new TimeInterval with a given number of minutes
    ///
    /// - Parameter minutes: The minutes to intiialize from
    public init(minutes: Int) {
        self = TimeInterval(minutes * 60)
    }
    
    
    /// Initializes a new TimeInterval with a given number of hours
    ///
    /// - Parameter hours: The hours to initialize from
    public init(hours: Int) {
        self = TimeInterval(hours * 60*60)
    }
    
    
    /// Initializes a new TimeInterval with a given number of days
    ///
    /// - Parameter days: The days to initialize from
    public init(days: Int) {
        self = TimeInterval(days * 60 * 60 * 24)
    }
}
