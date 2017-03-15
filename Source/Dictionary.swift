//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation


/// += operator for Dictionary. This takes the elements of the dictinary on the right and adds them to the elements of the dictionary on the left. Items on the left will be overwritten in the event of a key collision
///
/// - Parameters:
///   - left: The dictionary to add elements to
///   - right: The dictionary that will have its elements added from
func +=<K, V> (left: inout [K : V], right: [K : V]) {
    for (k, v) in right {
        left[k] = v
    }
}


/// + operator for Dictionary. This adds the contents of two dictionaries together and returns a new dictionary. If the two dictionaries contain the same key the key value pair from the right dictionary will be used in the new dictionary
///
/// - Parameters:
///   - left: The left dictionary
///   - right: The right dictionary
/// - Returns: A new dictionary with values from both the left and right right
func +<K, V> (left: [K : V], right: [K : V]) -> [K: V] {
    var left = left
    
    for (key, value) in right {
        left[key] = value
    }
    
    return left
    
}
