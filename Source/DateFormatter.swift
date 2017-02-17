//
//  DateFormatter.swift
//  Extensions
//
//  Created by Michael Leber on 2/16/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

extension DateFormatter {
//    static var dateFormatterCache: [String: ]
}


// MARK: - Working with Markit Digital MSDate
extension Date {
    private typealias Days = Double
    private struct Constants {
        // Number of days offset from the 0 day UNIX date
        static let MSDayOffset: Days = 25569;
        // Number of days offset from the 0 day Unix date as a TimeInterval
        static let MSDayOffsetSeconds: TimeInterval = Constants.MSDayOffset * Constants.DaySeconds
        // Number of seconds in an hour
        static let HourSeconds: TimeInterval = 60*60
        static let DaySeconds: TimeInterval = Constants.HourSeconds * 24
    }
    
    //TODO: Timezones
    // Input is "# of Days + fractional day"
    init(MSDate: Double) {
//        let days = Int(MSDate)
        let (days, fractionalDay) = modf(MSDate)
        
        // Offset to UNIX date and Convert to "TimeInterval" which is seconds + fractional second
        var ISODate = (TimeInterval(days) * Constants.DaySeconds) - Constants.MSDayOffsetSeconds
        let fractionalDayInSeconds = fractionalDay * Constants.DaySeconds
        // Calculate the day remainder
        ISODate += fractionalDayInSeconds
        
        self.init(timeIntervalSince1970: ISODate)
    }
}
