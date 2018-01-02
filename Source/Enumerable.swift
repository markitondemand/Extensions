//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation



/// Protocol support printing the cases of an enum
protocol EnumPrintable {
    static var countOfCases: Int { get }
}

extension EnumPrintable where Self: Hashable {
    static var countOfCases: Int {
        var count = 0
        for _ in iterateEnum(self) {
            count += 1
        }
        return count
    }
}


/// This will generate an Iterator that iterates over all of the cases of an enum. 
/// @warning Only enumerated types that _do not_ have associated types can be iterated using this function
///
/// - Parameter _: The type to iterate
/// - Returns: An iterator over all cases of an enum
func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}
