//
//  LocaLite.swift
//  LocaLite
//
//  Created by Yoni770 on 30/05/2019.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import Foundation
import UIKit




// MARK: LocaLite TODOs:



// MARK: 1. dev plan
// 1. add all config/setup
// 2. add validation function
// 3. move helper methods to utils
// 4. add default resetMainCtrl function
// 4.1 need to add a storyboard name
// 4.2 add option that developer can do his own reset views method
// 5. add handler for Font name
// 6.

// MARK: 2. Readme.md:
//    ----------------
//   1. add general pros using this librery
//   2. add some examples with gifs etc.
//   3. add how-to-use guide:
//   3.1 need to add required and optional values for the lib
//   3.2 need to describe all public methods and properties (need to choohs some framwork for that..)
//   3.3 ?

//  MARK: 3. Dev\R&D tasks:
//  ------------------------
//  (Some unsolved problems..)
//  1. need to think of solution when adding view programmatically
//  2. need to find how to change the views without restariting the whole storyborads



enum LocaLiteSettings: Hashable {
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
//        let settings : [LocaLiteCofing] = [
//            .supportRTL(true),
//            .forceLTRViews(["SomeView"]),
//            .supportedLanguagesCodes(["he","fr","en"]),
//            .defaultLanguageCode("en")
//        ]
////
//        LocaLite.config(configs)
//    }
//}

enum LLUserDefaultKey: String{
    case selectedLanguage = "LL_SelectedLanguage"
}

typealias LanguageChangedHandler = (_ newLanguage: String, _ error: Error)->()

final class LocaLite {

    private static let APPLE_APP_LANG_SUPPORT = "AppleLanguages"
    private static var bundleForLanguage: Bundle = Bundle()
    
    // config settings
    private var supportRTL: Bool?
    private static var forceLTRViews: [String]?
    private var supportedLanguagesCodes: [String]!
    private var RTLLanguagesCodes: [String]?
    private var defaultLanguageCode: String = "en"
    private var onLanguageChanged: LanguageChangedHandler?
    
    public var forceLTRViews: [String]? {
        get{
            LocaLite.forceLTRViews ?? []
        }
    }
    
    public var bundleForLanguage: Bundle {
        get{
            LocaLite.bundleForLanguage
        }
    }
    
    public var defaultAppLanguageCode: String{
        defaultLanguageCode
    }
    
    public func getUserSelectedLangCode() -> String {
        guard let lang = LocaLiteUtils.getValue(for: LLUserDefaultKey.selectedLanguage.rawValue) as? String else {
            return defaultLanguageCode
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
        if let current = LocaLite.getCurrentNativeAppLanguage(){
            defaultLanguageCode = current
        }
//        forceLTRViews = false
    }
    
    public static let shared = LocaLite()
    
    public func config(with settings: [LocaLiteSettings]){
//        validateRequiredSettings(settings)
        for setting in settings{
            switch setting {
            case .defaultLanguageCode(let defalut):
                print(defalut)
            case .supportedLanguagesCodes(let languageCodes):
                supportedLanguagesCodes = languageCodes
            default: break

            }
        }
//        let support =
//        let str: NSAttributedStringKey = .shadow
        
    }
    
//    private func validateRequiredSettings(_ settings: [LocaLiteSettings]){
//        settings.forEach { (setting) in
//
//        }
//    }
//
//    func settingHasValue(of setting: LocaLiteSettings, in settings: [LocaLiteSettings]) -> Bool{
//        return settings.filter { $0 == setting }.count > 0
//    }
//
    public func setSelectedLang(with langCode: String) {
//        let userData = User.getUserData(CoreDataUtils.sharedInstance.context)
//        userData?.selectedLanguage = langCode
//        CoreDataUtils.sharedInstance.saveContext()
        setUserLang(langCode)
        setNativeApplicationLanguage(with: langCode)
    }
    
    
    // MARK: bundle settings
    internal func getBundle(for langCode: String?) -> Bundle{
		var pathForLang: String? = ""
		
		if langCode != nil {
			pathForLang = langCode == "en" ? "Base" : langCode!
		} else {
			if let userLang = getUserLangCode(),
               supportedLanguagesCodes.contains(userLang){
//			let userDefaultsLang = AppData.getUserLang()
            //       also need to validate that they have a .string file
//            if supportedLanguagesCodes?.contains(userLang) ?? false {
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
        } else {
            assertionFailure("Bundle with path: '\(pathForLang ?? "")' not found!\n You need to add this bundle in your app's target")
        }
        return Bundle.main
    }
    
    internal func setBundleForLanguage(_ langCode: String? = nil){
        LocaLite.bundleForLanguage = getBundle(for: langCode)
    }
    
    // MARK: user language settings
    internal static func getCurrentNativeAppLanguage() -> String? {
        return Locale.current.languageCode
//        return (UserDefaults.standard.object(forKey: APPLE_APP_LANG_SUPPORT) as! NSArray)[0] as? String
    }
    
    internal func setNativeApplicationLanguage(with langCode: String) {
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
    
    func setupAppFonts(){
        //
        UITextField.appearance().substituteFontName = UIFont.appFontNameReg
        UILabel.appearance().substituteFontName     = UIFont.appFontNameReg
        UILabel.appearance().substituteFontNameBold = UIFont.appFontNameBold
		if let font = UIFont(name: UIFont.appFontNameReg, size: 16.5){
			UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font : font], for: .normal)			
		}
		UINavigationBar.appearance().semanticContentAttribute = isRtl() ? .forceRightToLeft : .forceLeftToRight
		
    }
    
    // MARK: Utilities
    internal func isRtl() -> Bool {
        if let rtlLangs = RTLLanguagesCodes,
           let userLang = getUserLangCode(),
                rtlLangs.contains(userLang) {
            return true
        }
        return false
    }
    
    internal static func getLanguageDisplayName(langCode: String) -> String?{
        let local = Locale(identifier: langCode)
        return local.localizedString(forLanguageCode: langCode)
    }
    
//    internal static func getLanguageCodeForRegion() -> String{
//        if let region = Locale.current.regionCode{
//            switch region {
//                case "IL":
//                    return "he"
//                case "GE":
//                    return "ka"
//                default:
//                    return "en"
//            }
//        }
//        return "en"
//    }
//
    internal func setUserLang(_ langCode: String?){
        let data = UserDefaults.standard
        data.set(langCode, forKey: LLUserDefaultKey.selectedLanguage.rawValue)
        data.synchronize()
    }
//
    internal func getUserLangCode() -> String? {
        return LocaLiteUtils.getValue(for: LLUserDefaultKey.selectedLanguage.rawValue) as? String
    }
//
    internal func getAvailableLanguages() -> [String]?{
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
