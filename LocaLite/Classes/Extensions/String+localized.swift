//
//  String+localized.swift
//  LocaLite
//
//  Created by Ben Ohana on 15/06/2016.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import Foundation

extension String {
    public func localized(comment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: LocaLite.shared.bundleForLanguage, value: "", comment: comment)
    }
    
    public func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: LocaLite.shared.bundleForLanguage, value: "", comment: "")
    }

}
