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
    
    func getShortLangCode(of languageCode: String) -> String{
        return languageCode.contains("-") ? String(languageCode.split(separator: "-").first ?? "") : languageCode
    }

    func getLocalDisplayName(for languageCode: String) -> String{
        // first take the english label
        let langCode = getShortLangCode(of: languageCode)
        // now let's take the language's own display name
        let locale = NSLocale(localeIdentifier: langCode)
        let currentLangLabel = locale.displayName(forKey: .identifier, value: langCode) ?? ""
        return currentLangLabel
    }
    
    func getEnglishDisplayName(for languageCode: String) -> String{
        let langCode = getShortLangCode(of: languageCode)
        // first take the english label
        let enLocale = NSLocale(localeIdentifier: "en")
        let englishLangName = enLocale.displayName(forKey: .identifier, value: langCode) ?? ""
        return englishLangName
    }
    
    func getDisplayNameWithLocalName(for languageCode: String, with: Bool) -> String{
        let langCode = getShortLangCode(of: languageCode)
        return """
            \(getEnglishDisplayName(for: languageCode)) (\(getLocalDisplayName(for: langCode)))
        """
    }
}
