//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation
import UIKit

// MARK: Constructors
extension UIColor {
    /// Creates a new color with a given hex string. The hex should be "RRGGBBAA" (AA being alpha or opacity). Optionally the alpha channel can be omitted and a value of 1.0 will be used. 
    /// If the input string is malformed, or cannot be covnerted to a hex number, nil will be returned.
    ///
    /// - Parameter hexValue: The incoming hex string
    public convenience init?(hexValue: String) {
        var hexValue = hexValue
        
        // Clean off any leading # if it is there.
        hexValue = hexValue.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        // Unsupported length
        guard hexValue.characters.count == 6 || hexValue.characters.count == 8 else {
            return nil
        }
        
        var alphaComponent: CGFloat = 1.0
        // If input is 8 characters. extract the alpha value
        if hexValue.characters.count == 8 {
            guard let hexNumber = Int(hexValue.substring(from:hexValue.index(hexValue.endIndex, offsetBy: -2)), radix:16) else {
                return nil
            }
            alphaComponent = CGFloat(hexNumber)/255.0
            
            hexValue = hexValue.substring(to: hexValue.index(hexValue.endIndex, offsetBy:-2))
        }
        
        
        // Create the hexidecimal number
        guard let hexNumber = Int(hexValue, radix:16) else {
            return nil
        }
        self.init(rgbHex: hexNumber, alpha: alphaComponent)
    }
    
    /// Creates a new UIColor object using a given hex integer. This will create a color with 100% alpha. This should be in the range from 0x0 to 0xFFFFFF
    ///
    /// - Parameters:
    ///   - rgbHex: The inout integer, interpreted as a hex value. This must be between 0x0 and 0xFFFFFF
    ///   - alpha: The alpha value to use. This should be between 0.0 and 1.0
    public convenience init(rgbHex: Int, alpha: CGFloat = 1.0) {
        precondition(rgbHex >= 0x0 && rgbHex <= 0xFFFFFF)
        
        let r = (rgbHex >> 16) & 0xFF
        let g = (rgbHex >> 8) & 0xFF
        let b = (rgbHex) & 0xFF
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha:alpha)
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

