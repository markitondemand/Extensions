//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

// MARK: URL Encoding

@available(iOS 10, *)
extension String {
    
    /// Returns a new string from the current string encoding any values that are not allowed within a URLQuery.
    ///
    /// - Returns: A new string encoded to work within a URLQuery
    public func stringByEncodingForURLQuery() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    
    /// Encodes the current string to work within a URLQuery.
    public mutating func encodeForURLQuery() {
        self = self.stringByEncodingForURLQuery()
    }
}


extension String {
    
    /// Returns a substring from a starting integer character point, to the end of the string
    ///
    /// - Parameter from: The starting integer character point
    /// - Returns: The new substring
    public func substring(from: Int) -> String {
        return String(self[self.index(startIndex, offsetBy: from)...])
    }
    
    /// Returns a substring from the start of the string to a given integer character point
    ///
    /// - Parameter to: The ending character point
    /// - Returns: The new substring
    public func substring(to: Int) -> String {
        return String(self[..<self.index(self.startIndex, offsetBy: to)])
    }
    
    
    /// Returns a substring between a given Range. The range's upperBound must not exceed the number of characters in the string
    ///
    /// - Parameter with: The range to create a substring between
    /// - Returns: The new substring
    public func substring(with: Range<Int>) -> String {
        let indexRange = self.index(startIndex, offsetBy: with.lowerBound)..<self.index(startIndex, offsetBy: with.upperBound)
        return String(self[indexRange.lowerBound..<indexRange.upperBound])
    }
}

extension UIColor
{
    
    /// Returns a color to a valid Hex String output prefixed with "#" in the form #RRGGBBAA
    /// ```
    /// UIColor.white.toHextString()
    /// // outputs "#FFFFFFFF"
    /// ```
    ///
    /// - Returns: The color as a hex string value in the form #RRGGBBAA
    public func toHexString() -> String
    {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgba:Int = Int(r*255.0)<<24 | Int(g*255.0)<<16 | Int(b*255.0)<<8 | Int(a*255.0)
        
        return String(format:"#%08x", rgba).uppercased()
    }
}


// MARK: - Color support
extension String
{
    
    /// Try to convert a string to a color. The string must be in a valid hex form (i.e. "#FFFFFF" or "FFFFFF" or "#FFFFFFFF"). Please see the init(hexValue:) constructor for more information
    ///
    /// - Returns: The value as a UIColor, or nil if a valid color could not be made.
    public func toColor() -> UIColor?
    {
        return UIColor(hexValue: self)
    }
}
