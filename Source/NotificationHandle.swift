//  Oriignally created by Cliff Dekoker
//  Copyright © 2018 IHS Markit. All rights reserved.
//

import Foundation


/// This class handles signing up to notifications and reporting out
public class NotificationHandle {
    private let token: Any
    weak var center: NotificationCenter?
    
    
    /// Creates a new `NotificationHandle` that will watch for a given notification
    ///
    /// - Parameters:
    ///   - name: The name of the notification
    ///   - center: The `NotificationCenter` to watch from (Default is `NotificationCenter.default`)
    ///   - filterObject: The object to filter on (Default is `nil`)
    ///   - queue: The `OperationQueue` to send notifications on (Default is `OperationQueue.main`)
    ///   - closure: The call back closure
    init(_ name: Notification.Name, center: NotificationCenter = NotificationCenter.default, filterObject: Any? = nil, queue: OperationQueue = OperationQueue.main, closure: @escaping ((Notification) -> Void)) {
        self.token = center.addObserver(forName: name, object: filterObject, queue: queue, using: closure)
        self.center = center
    }
    
    deinit {
        if let center = center {
            center.removeObserver(token)
        }
    }
}


// MARK: - Notification.Name extension for generating observable closures
public extension Notification.Name {
    
    /// Signs up to watch the current Notification.Name - returned object should be retained by the client
    /// - Parameters:
    ///   - center: The `NotificationCenter` to watch from (Default is `NotificationCenter.default`)
    ///   - filterObject: The object to filter on (Default is `nil`)
    ///   - queue: The `OperationQueue` to send notifications on (Default is `OperationQueue.main`)
    ///   - closure: The call back closure
    /// - Returns: A NotificationHandle that should be retaiend by the client
    func handle(_ center: NotificationCenter = NotificationCenter.default, filterObject: Any? = nil, queue: OperationQueue = OperationQueue.main, closure: @escaping ((Notification)-> Void)) -> NotificationHandle {
        return NotificationHandle(self, center: center, filterObject: filterObject, queue: queue, closure: closure)
    }
}
