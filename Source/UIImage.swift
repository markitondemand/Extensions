//  Created by Michael Leber on 5/19/17.
//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    /// Returns a UIImage of a given size from a given color
    ///
    /// - Parameter color: The color to use
    /// - Parameter size: The size of the image. Default is (1,1)
    /// - Returns: A new UIImage, or nil of the image could not be made
    public class func imageFromColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }

}
