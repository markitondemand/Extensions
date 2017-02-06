//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation
import UIKit

// MARK: Constructors
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
    
    /// Creates a new UIColor object using a given hex integer. This accounts for having a tail alpha compoennt. This must be in the range from 0x0 to 0xFFFFFFFF or an error is reaised
    ///
    /// - Parameter rgbaHex: The input integer, interpreted as a hex value
    public convenience init(rgbaHex:Int) {
        //TODO: to improve error handling, we might want to create a type "HEXColor" that is passed to this constructor.... It could handle initializng the proper HEX format (0xFFFFFF + FF for alpha) and handle the optional alpha more gracefully. The fear here is someone inputs 6 HEX and not alpha and an incorrect color is generated. Or the value could be beyond the maximum range 0xFFFFFFFF.
        precondition(rgbaHex > 0x0 && rgbaHex <= 0xFFFFFFFF)
        
        let r = (rgbaHex >> 24) & 0xFF
        let g = (rgbaHex >> 16) & 0xFF
        let b = (rgbaHex >> 8) & 0xFF
        let alpha = (rgbaHex) & 0xFF
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha:CGFloat(alpha)/255.0)
    }
    
    
    /// Creates a new UIColor object using a given hex integer. This will create a color with 100% alpha. This should be in the range from 0x0 to 0xFFFFFF
    ///
    /// - Parameter rgbHex: The inout integer, interpreted as a hex value
    public convenience init(rgbHex:Int) {
        precondition(rgbHex > 0x0 && rgbHex <= 0xFFFFFF)

        let r = (rgbHex >> 16) & 0xFF
        let g = (rgbHex >> 8) & 0xFF
        let b = (rgbHex) & 0xFF
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha:1.0)
    }
}

// MARK: Access Color Attributes
extension UIColor {
    /// Returns the red value component as a CGFloat between 0 and 1. This will return nil if the color space is NOT set to RGB or Monochrome
    public var redValue: CGFloat? {
        get {
            guard let colorSpaceModel = self.colorSpaceModel() else {
                return nil
            }
            switch colorSpaceModel {
            case .rgb, .monochrome:
                return self.cgColor.components?[0]
            default:
                return nil
            }
        }
    }
    
    /// Returns the green value component as a CGFloat between 0 and 1. This will return nil if the color space is NOT set to RGB or Monochrome
    public var greenValue: CGFloat? {
        get {
            guard let colorSpaceModel = self.colorSpaceModel() else {
                return nil
            }
            switch colorSpaceModel {
            case .rgb:
                return self.cgColor.components?[1]
            case .monochrome:
                return self.cgColor.components?[0]
            default:
                return nil
            }
        }
    }
    
    /// Returns the blue value component as a CGFloat between 0 and 1. This will return nil if the color space is NOT set to RGB or Monochrome
    public var blueValue: CGFloat? {
        get {
            guard let colorSpaceModel = self.colorSpaceModel() else {
                return nil
            }
            switch colorSpaceModel {
            case .rgb:
                return self.cgColor.components?[2]
            case .monochrome:
                return self.cgColor.components?[0]
            default:
                return nil
            }
        }
    }
    
    /// Returns the color's current Alpha value
    public var alphaValue: CGFloat? {
        get { return self.cgColor.alpha }
    }
    
    public var rgbHex: Int? {
        get {
            guard let r = self.redValue, let g = self.greenValue, let b = self.blueValue else {
                return nil
            }
            return (Int(r * 255) << 16) | (Int(g * 255) << 8) | Int(b * 255)
        }
    }
    
    // MARK: String Representation
    
    /// Returns a hex representation of the input string. This will return nil if the color cannot be converted to the RGB color space.
    public var hexString: String? {
        get {
            guard let rgbHex = self.rgbHex else {
                return nil
            }
            return String(format: "%0.6X", rgbHex)
        }
    }
    
    private func colorSpaceModel() -> CGColorSpaceModel? {
        return self.cgColor.colorSpace?.model
    }
}

