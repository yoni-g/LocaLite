//
//  String+localized.swift
//  LocaLite
//
//  Created by Ben Ohana on 15/06/2016.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import Foundation

extension String {
    func localized(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: LocaLite.bundleForLanguage, value: "", comment: comment)
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: LocaLite.bundleForLanguage, value: "", comment: "")
    }

}
