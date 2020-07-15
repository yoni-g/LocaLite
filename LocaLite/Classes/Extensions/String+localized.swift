//
//  String+localized.swift
//  Diplomat-iOS
//
//  Created by Ben Ohana on 15/06/2016.
//  Copyright © 2016 BA Link. All rights reserved.
//

import Foundation

extension String {
    func localized(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: LocalizationUtils.bundleForLanguage, value: "", comment: comment)
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: LocalizationUtils.bundleForLanguage, value: "", comment: "")
    }

}
