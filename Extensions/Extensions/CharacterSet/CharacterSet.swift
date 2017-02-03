//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation



extension CharacterSet {
    
    /// Returns all of the characters in a given character set. Please note, depending on the set, this could be quite large and take a while
    var characters: [Character] {
        var result: [Character] = []
        for plane: UInt8 in 0...16 where self.hasMember(inPlane: plane) {
            for unicode in UInt32(plane) << 16 ..< UInt32(plane + 1) << 16 {
                if let uniChar = UnicodeScalar(unicode), self.contains(uniChar) {
                    result.append(Character(uniChar))
                }
            }
        }
        return result
    }
}
