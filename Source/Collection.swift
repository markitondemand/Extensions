//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation


// MARK: - Optional subscript
extension Collection {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
