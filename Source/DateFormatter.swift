//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

extension DateFormatter {
    @nonobjc static var cache: [String:DateFormatter] = [:]
    
    ///  Formats a date into a string with a given format, and optional TimeZone and optional Locale. This method also does the dirty work of caching DateFormatter's of a given format for performance reasons. Usually you need to manage this yourself
    ///
    /// - Parameters:
    ///   - date: The date to format
    ///   - format: The format
    ///   - timeZone: The time zone (default is TimeZone.current)
    ///   - locale: The locale to use (default is Locale.current)
    /// - Returns: A formatted date string
    public class func string(from date: Date, format: String, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> String {
        let formatter = self.dateFormatter(format: format)
        formatter.timeZone = timeZone
        formatter.locale = locale
        
        return formatter.string(from: date)
    }
    
    // Possible TODO - Throw errors instead of optional return.
    /// Creates a date object from a given input string. Nil will be returned if the date cannot be created based on the input parameters
    ///
    /// - Parameters:
    ///   - dateString: The date string to attempt to turn into a date object
    ///   - format: The dateformat of the input
    ///   - timeZone: The timezone to use. Default is TimeZone.current
    ///   - locale: The locale to use. Default is Locale.current
    /// - Returns: The dateString as a Date object, or nil
    public class func date(from dateString: String, format: String, timeZone: TimeZone = TimeZone.current, locale: Locale = Locale.current) -> Date? {
        
        let formatter = self.dateFormatter(format: format)
        formatter.timeZone = timeZone
        formatter.locale = locale
        
        return formatter.date(from: dateString)
    }
    
    
    /// Returns a DateFormatter with the given format. The resulting formatter is also cached.
    ///
    /// - Parameter format: The format to use
    /// - Returns: The new DateFormatter using the given format
    public class func dateFormatter(format: String) -> DateFormatter {
        guard let formatter = cache[format] else {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            cache[format] = formatter
            
            return formatter
        }
        return formatter
    }
}
