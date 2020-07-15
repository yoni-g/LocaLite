//
//  LocalizationUtils.swift
//  Diplomat-iOS
//
//  Created by Yoni770 on 30/05/2019.
//  Copyright © 2019 BA Link. All rights reserved.
//

import Foundation
import UIKit

class LocalizationUtils {

    static let APPLE_APP_LANG_SUPPORT = "AppleLanguages"
    static var bundleForLanguage: Bundle = Bundle()
    static let forceLTRViews: [String] = ["NavBar", "navBar", "UINavigationBar","loadingView"]
    
    init() {
        
    }
    
    func config(){
        
    }
    
    // MARK: bundle settings
    static func getBundleLanguages(_ langCode: String?) -> Bundle{
		var pathForLang: String = ""
		
		if langCode != nil {
			pathForLang = langCode == "en" ? "Base" : langCode!
		} else {
			let userLang = getUserSelectedLang()
//			let userDefaultsLang = AppData.getUserLang()
			
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
    
    static func setBundleForLanguage(_ langCode: String? = nil){
        bundleForLanguage = getBundleLanguages(langCode)
    }
    
    // MARK: user language settings
    static func getCurrentNativeAppLanguage() -> String? {
        return Locale.current.languageCode
//        return (UserDefaults.standard.object(forKey: APPLE_APP_LANG_SUPPORT) as! NSArray)[0] as? String
    }
    
    static func setNativeApplicationLanguage(with langCode: String) {
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
    static func isRtl() -> Bool {
        if getUserSelectedLang() == "he" {
            return true
        }
        else {
            return false
        }
    }
    
    static func getLanguageDisplayName(langCode: String) -> String?{
        let local = Locale(identifier: langCode)
        return local.localizedString(forLanguageCode: langCode)
    }
    
    static func getLanguageCodeForRegion() -> String{
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
    
    static func getUserSelectedLang() -> String {
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
        // if the value of userData (or it self) is nil -> return the default lang for user region..
        return ""//LocalizationUtils.getLanguageCodeForRegion()
    }
//
    static func setUserSelectedLang(with langCode: String) {
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
//        userData?.selectedLanguage = langCode
//        CoreDataUtils.sharedInstance.saveContext()
        setUserLang(langCode)
        setNativeApplicationLanguage(with: langCode)
    }
//
    static func setUserLang(_ langCode: String?){
//        let data = UserDefaults.standard
//        data.set(langCode, forKey: USER_LANG)
//        data.synchronize()
    }
//
//    static func getUserLang() -> String? {
//        return getValueForKey(USER_LANG) as? String
//    }
//
    static func getAvailableLanguages() -> [String]?{
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
//        if let languages = userData?.availableLanguages{
//            return languages.components(separatedBy:",")
//        }
        return nil
    }
//
    static func getDefaultAppLanguage() -> String?{
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
//        if let defaultLanguage = userData?.defaultLanguage{
//            return defaultLanguage
//        }
        return nil
    }
    
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
