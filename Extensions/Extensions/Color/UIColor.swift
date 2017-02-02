//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Creates a new color with a given hex string. The hex should be "RRGGBBAA" (AA being alpha or opacity). Optionally the alpha channel can be omitted and 1.0 will be used
    ///
    /// - Parameter hexValue: The incoming hex string
    public convenience init?(hexValue: String) {
        var hexValue = hexValue
        
        // Clean off any leading # if it is there.
        if hexValue.range(of: "#") != nil {
            hexValue = hexValue.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        }
        
        // Unsupported length
        guard hexValue.characters.count == 6 || hexValue.characters.count == 8 else {
            return nil
        }
        
        // If input is 6, Modify string to 8 characters for our later usage.
        if hexValue.characters.count == 6 {
           hexValue.append("FF")
        }
        
        
        // Create the hexidecimal number
        guard let hexNumber = Int(hexValue, radix:16) else {
            return nil
        }
        
        
        self.init(rgbaHex: hexNumber)
    }
    
    /// Creates a new UIColor object using a given hex integer. This accounts for having a tail alpha compoennt. This should be in the range from 0x0 to 0xFFFFFFFF
    ///
    /// - Parameter rgbaHex: The input integer, interpreted as a hex value
    public convenience init(rgbaHex:Int) {
        let r = (rgbaHex >> 24) & 0xFF
        let g = (rgbaHex >> 16) & 0xFF
        let b = (rgbaHex >> 8) & 0xFF
        let alpha = (rgbaHex) & 0xFF
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha:CGFloat(alpha)/255.0)
    }
    
    
    /// Creates a new UIColor object using a given hex integer. This will create a color with 100% alpha.
    ///
    /// - Parameter rgbHex: The inout integer, interpreted as a hex value
    public convenience init(rgbHex:Int) {
        let r = (rgbHex >> 16) & 0xFF
        let g = (rgbHex >> 8) & 0xFF
        let b = (rgbHex) & 0xFF
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha:1.0)
    }
    
    // To be added
    // Ways to generate a HEX string from a color object
}
