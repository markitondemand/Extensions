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
}


//@property (nonatomic, readonly) CGFloat red;
//@property (nonatomic, readonly) CGFloat green;
//@property (nonatomic, readonly) CGFloat blue;
//@property (nonatomic, readonly) CGFloat alpha;
//@property (nonatomic, readonly) CGFloat white;
//@property (nonatomic, readonly) UInt32 rgbHex;
//@property (nonatomic, readonly) BOOL canProvideRGBComponents;
//@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
//
//+ (UIColor*) colorWithRGBHex:(UInt32) hex;
//+ (UIColor*) colorWithRGBAHex:(UInt32) rgba;
//
//// creates a UIColor object based on the hex string passed in. This does not use a cache
//+ (UIColor*) colorWithHexString:(NSString *)hexString;
//
//// creates a UIColor object based on the hex string passed in. This uses a cache
//+ (UIColor*) cachedColorWithHexKey:(NSString*) hexKey;
//
//// returns a string that looks like @"xxxxxx" (no alpha) which can be used in +colorWithHexString:
//- (NSString*) hexStringFromColor;
//
//// returns @"{rr, gg, bb, aa}"
//- (NSString*) stringFromColor;
//
//// XcodeColors support
////
//// returns a string compatible with XcodeColors for the current color. This will return @"\033[fgr,g,b;" where r, g, and b come from the current color
//- (NSString*) fg;
//+ (NSString*) resetfg;
//
//- (NSString*) bg;
//+ (NSString*) resetbg;
