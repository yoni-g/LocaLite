//
//  LocaLiteUtils.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 24/08/2020.
//

import Foundation

final internal class LocaLiteUtils {
    // helpers
    static func getValue(for key: LLUserDefaultKey) -> AnyObject? {
        let data = UserDefaults.standard
        return data.object(forKey: key.rawValue) as AnyObject?
    }
}
