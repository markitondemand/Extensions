//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

// MARK: URL Encoding

@available(iOS 10, *)
extension String {
    public func stringByEncodingForURLQuery() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
}


extension String {
    
    /// Returns a substring from a starting integer character point, to the end of the string
    ///
    /// - Parameter from: The starting integer character point
    /// - Returns: The new substring
    public func substring(from: Int) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }
    
    /// Returns a substring from the start of the string to a given integer character point
    ///
    /// - Parameter to: The ending character point
    /// - Returns: The new substring
    public func substring(to: Int) -> String {
        return self.substring(to: self.index(self.startIndex, offsetBy: to))
    }
    
    
    /// Returns a substring between a given Range. The range's upperBound must not exceed the number of characters in the string
    ///
    /// - Parameter with: The range to create a substring between
    /// - Returns: The new substring
    public func substring(with: Range<Int>) -> String {
        let indexRange = self.index(startIndex, offsetBy: with.lowerBound)..<self.index(startIndex, offsetBy: with.upperBound)
        return self.substring(with: indexRange)
    }
}
