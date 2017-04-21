//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

/// Protocol for easily adapting an enum for notifications
///
/// To use you can do the following
/// ```
/// enum MyNotification: String, NotificationName {
///     case ThingOne
///     case ThingTwo
///     case ErrorThing
/// }
/// ```
/// Then pass the enum directly to the .post method of NotificationCenter like the following
/// ```
/// NotificationCenter.default.post(name: MyNotification.ThingOne, object: nil, userInfo: nil)
/// ```
///
public protocol NotificationName {
    
    /// Returns the expected Notification.Name for
    var name: Notification.Name { get }
}


// MARK: - RawRepresntable Extension
// This extension creates the default functionality required for the .name property from the protocol above to work on any enum that is also RawRepresentable (e.g. any enum that is a String is also RawRepresentable)
public extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        get {
            return Notification.Name(self.rawValue)
        }
    }
}
