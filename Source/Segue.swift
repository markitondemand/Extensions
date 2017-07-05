//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation


/// Adopt this protocol on any enum that you want to use for the identifiers of a Segue. Declaring the enum as a rawtype of "String" will give you a base implementation of the "identifier" var that simply returns the rawValue
public protocol SegueIdentifier {
    var identifier: String { get }
}

public extension RawRepresentable where RawValue == String, Self: SegueIdentifier {
    
    /// Returns the identifier of a segue. This should match with a segueIdentifier in the story board
    var identifier: String {
        return self.rawValue
    }
}

extension UIViewController {
    
    /// Convenience method that takes a "SegueIdentifier" and performs that segue, removing the need to call "identifier" on the SegueIdentifier instance
    ///
    /// - Parameters:
    ///   - identifier: The SegueIdentifier to perform a segue with
    ///   - sender: The sender that performed the segue (usually "self")
    public func performSegue(withIdentifier identifier: SegueIdentifier, sender: Any?) {
        performSegue(withIdentifier: identifier.identifier, sender: sender)
    }
}
