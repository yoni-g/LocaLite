//
//  LocaLite.swift
//  LocaLite
//
//  Created by Yoni770 on 30/05/2019.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import Foundation
import UIKit

enum LocaLiteCofing: Hashable {
    case supportRTL(_  willSupport: Bool)
    case forceLTRViews(_  viewNames: [String])
    case supportedLanguagesCodes(_  languages: [String])
    case defaultLanguageCode(_ defaultLanguage: String)
//    case onLanguageChanged(_ closure: ()->())
}

//extension LocaLiteCofing{
//    var type<T> -> T{
//
//    }
//}
//struct testing {
//
//    init() {
//
//        let configs : [LocaLiteCofing] = [
//            .supportRTL(true),
//            .forceLTRViews(["SomeView"]),
//            .supportedLanguagesCodes(["he","fr","en"]),
//            .defaultLanguageCode("en")
//        ]
//
//        LocaLite.config(configs)
//    }
//}

final class LocaLite {

    private static let APPLE_APP_LANG_SUPPORT = "AppleLanguages"
    private static let LocaLite_SELECTED_LANG = "LocaLite_SelectedLanguage"
    private static var bundleForLanguage: Bundle = Bundle()
    
    // config settings
    private static var supportRTL: Bool?
    private static var forceLTRViews: [String]?
    private static var supportedLanguagesCodes: [String]?
    private static var defaultLanguageCode: String = "en"
    private static var onLanguageChanged: (()->())?
    
    public var forceLTRViews: [String] {
        get{
            return LocaLite.forceLTRViews ?? []
        }
    }
    
    public var bundleForLanguage: Bundle {
        get{
            return LocaLite.bundleForLanguage
        }
    }
    
    public var defaultAppLanguageCode: String{
        get{
            return LocaLite.defaultLanguageCode
        }
    }
    
    public static func getUserSelectedLangCode() -> String {
        guard let lang = LocaLiteUtils.getValueForKey(LocaLite_SELECTED_LANG) as? String else {
            return LocaLite.defaultLanguageCode
        }
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
        // if the value of userData (or it self) is nil -> return the default lang for user region..
        return lang//LocalizationUtils.getLanguageCodeForRegion()
    }
    
//    public var defaultAppLanguageLabel: String?{
//        get{
//
//            let local = Locale(identifier: LocaLite.defaultLanguageCode ?? "en")
//            return local.localizedString(forLanguageCode: LocaLite.defaultLanguageCode ?? "")
//        }
//    }
    
    private init() {
//        forceLTRViews = false
    }
    
    public static let shared = LocaLite()
    
    public static func config(_ configs: [LocaLiteCofing]){
//        for config in configs{
//            switch config {
//            case .defaultLanguageCode(let defalut):
//                print(defalut)
//            default:
//
//            }
//        }
//        let support =
//        let str: NSAttributedStringKey = .shadow
    }
    
    public static func setSelectedLang(with langCode: String) {
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
//        userData?.selectedLanguage = langCode
//        CoreDataUtils.sharedInstance.saveContext()
        setUserLang(langCode)
        setNativeApplicationLanguage(with: langCode)
    }
    
    
    // MARK: bundle settings
    internal static func getBundle(for langCode: String?) -> Bundle{
		var pathForLang: String? = ""
		
		if langCode != nil {
			pathForLang = langCode == "en" ? "Base" : langCode!
		} else {
			let userLang = getUserLangCode()
//			let userDefaultsLang = AppData.getUserLang()
			// MARK: TODO: chnage to available languages
            //       also need to validate that they have a .string file
			if userLang == "he" || userLang == "ka" {
				pathForLang = userLang
//			} else if userLang == "" && userDefaultsLang != nil && userDefaultsLang!.contains("en") == false{
//				pathForLang = userDefaultsLang!
			} else {
				pathForLang = "Base"
			}
		}
        
        if let bundlePath = Bundle.main.path(forResource: pathForLang, ofType: "lproj"){
            let bundle = Bundle(path: bundlePath)
            return bundle!
        }
        return Bundle.main
    }
    
    internal static func setBundleForLanguage(_ langCode: String? = nil){
        bundleForLanguage = getBundle(for: langCode)
    }
    
    // MARK: user language settings
    internal static func getCurrentNativeAppLanguage() -> String? {
        return Locale.current.languageCode
//        return (UserDefaults.standard.object(forKey: APPLE_APP_LANG_SUPPORT) as! NSArray)[0] as? String
    }
    
    internal static func setNativeApplicationLanguage(with langCode: String) {
//        let data = UserDefaults.standard
//        data.set([langCode], forKey: APPLE_APP_LANG_SUPPORT)
//        data.synchronize()

        setBundleForLanguage(langCode)
        setupAppFonts()
        //setAppSemanticDirection(with: langCode)
    }
    
//    static func setAppSemanticDirection(with langCode: String){
//        Utils.changeView {
//            UIView.appearance().semanticContentAttribute = (langCode == "he" ? .forceRightToLeft : .forceLeftToRight)
//        }
//    }
    
    static func setupAppFonts(){
        UITextField.appearance().substituteFontName = UIFont.appFontNameReg
        UILabel.appearance().substituteFontName     = UIFont.appFontNameReg
        UILabel.appearance().substituteFontNameBold = UIFont.appFontNameBold
		if let font = UIFont(name: UIFont.appFontNameReg, size: 16.5){
			UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : font], for: .normal)			
		}
		UINavigationBar.appearance().semanticContentAttribute = isRtl() ? .forceRightToLeft : .forceLeftToRight
		
    }
    
    // MARK: Utilities
    internal static func isRtl() -> Bool {
        if getUserLangCode() == "he" {
            return true
        }
        else {
            return false
        }
    }
    
    internal static func getLanguageDisplayName(langCode: String) -> String?{
        let local = Locale(identifier: langCode)
        return local.localizedString(forLanguageCode: langCode)
    }
    
    internal static func getLanguageCodeForRegion() -> String{
        if let region = Locale.current.regionCode{
            switch region {
                case "IL":
                    return "he"
                case "GE":
                    return "ka"
                default:
                    return "en"
            }
        }
        return "en"
    }
//
    internal static func setUserLang(_ langCode: String?){
        let data = UserDefaults.standard
        data.set(langCode, forKey: LocaLite_SELECTED_LANG)
        data.synchronize()
    }
//
    internal static func getUserLangCode() -> String? {
        return LocaLiteUtils.getValueForKey(LocaLite_SELECTED_LANG) as? String
    }
//
    internal static func getAvailableLanguages() -> [String]?{
        return nil
    }
//

    
    // from appDelegate screen
//    func setupLanguage() {
//        let defaultSalesOrgLang = getDefaultAppLanguage()
//        let userSelectedLang    = getUserSelectedLang()
//        let currentAppLang      = getCurrentNativeAppLanguage()
//        // 1. for initial app load
//        if userSelectedLang == "" {
//
//            if defaultSalesOrgLang == nil{
//                let lang = getLanguageCodeForRegion()
//                setUserSelectedLang(with: currentAppLang ?? lang)
////                LocalizationUtils.setBundleForLanguage(currentAppLang ?? lang)
//                return
//            } else {
//                setUserSelectedLang(with: defaultSalesOrgLang!)
//                return
//            }
//        }
//        // 2. if the language needs to be changed
//        if userSelectedLang != currentAppLang {
//            AppData.setUserSelectedLang(with: userSelectedLang)
//        }
//        LocalizationUtils.setBundleForLanguage()
//        LocalizationUtils.setupAppFonts()
//    }
//    // from loading screen
//    func updateUserSettings(){
//        let userSelectedLang = AppData.getUserSelectedLang()
//        let currentAppLang   = LocalizationUtils.getCurrentNativeAppLanguage()
//        if userSelectedLang != currentAppLang {
//            if userSelectedLang == ""{
//                var languageToSave: String?
//                if let defaultSalesOrgLang = AppData.getDefaultAppLanguage(){
//                    AppData.setUserSelectedLang(with: defaultSalesOrgLang)
//                    languageToSave = defaultSalesOrgLang
//                } else {
//                    let deviceLang = LocalizationUtils.getLanguageCodeForRegion()
//                    if currentAppLang != deviceLang && currentAppLang != nil{
//                        AppData.setUserSelectedLang(with: currentAppLang!)
//                        languageToSave = currentAppLang!
//                    } else {
//                        AppData.setUserSelectedLang(with: deviceLang)
//                        languageToSave = deviceLang
//                    }
//                }
//                if languageToSave != nil && languageToSave != ""{
//                    DiplomatWS.updateUserLanguage(languageToSave!) { (err) in
//                        if let err = err {
//                            print("\((#file, #function, "Error changing language", err.description))")
//                        }
//                    }
//                }
//            } else {
//                AppData.setUserSelectedLang(with: userSelectedLang)
//            }
//        }
//    }
}
