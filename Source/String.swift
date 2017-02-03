//  Copyright © 2017 Markit. All rights reserved.
//

import Foundation

// MARK: URL Encoding

@available(iOS 10, *)
extension String {
    func stringByEncodingForURLQuery() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
}
