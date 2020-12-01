//
//  LocaLiteUtils.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 24/08/2020.
//

import Foundation

final internal class LocaLiteUtils {
    // helpers
    static func getValueFor(_ key: String) -> AnyObject? {
        let data = UserDefaults.standard
        return data.object(forKey: key) as AnyObject?
    }
}
