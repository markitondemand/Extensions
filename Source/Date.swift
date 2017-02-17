//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

// MARK: - Working with Markit Digital MSDate
extension Date {
    private typealias Days = Double
    private struct Constants {
        // MSDate has an offset from 0 day unix
        static let MSDayOffset: Days = 25569;
        // Number of days offset from the 0 day Unix date as a TimeInterval
        static let MSDayOffsetSeconds: TimeInterval = Constants.MSDayOffset * Constants.DaySeconds
        // Number of seconds in an hour
        static let HourSeconds: TimeInterval = 60*60
        static let DaySeconds: TimeInterval = Constants.HourSeconds * 24
    }
    
    
    /// Converts a Markit Digital MSDate to a Unix Date object. This will convert down to seconds but may be off a second or so due to precision problems. This has been tested to be accurate to 0.0000001 of a 24 hour period
    ///
    /// - Parameter MSDate: The input MSDate object
    public init(MSDate: Double) {
        let (days, fractionalDay) = modf(MSDate)
        
        // Offset to UNIX date and Convert to "TimeInterval" which is seconds + fractional second
        var ISODate = (TimeInterval(days) * Constants.DaySeconds) - Constants.MSDayOffsetSeconds
        let fractionalDayInSeconds = fractionalDay * Constants.DaySeconds
        
        // Calculate the day remainder
        ISODate += fractionalDayInSeconds
        
        self.init(timeIntervalSince1970: ISODate)
    }
    
    
    /// Converts the current date to an MSDate Double.
    public var MSDate: Double {
        get {
            return (self.timeIntervalSince1970 / Constants.DaySeconds) + Constants.MSDayOffset
        }
    }
}
