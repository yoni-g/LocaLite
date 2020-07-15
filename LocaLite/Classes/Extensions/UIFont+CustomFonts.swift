//
//  UIFont+CustomFonts.swift
//  Diplomat-iOS
//
//  Created by Yoni770 on 05/06/2019.
//  Copyright © 2019 BA Link. All rights reserved.
//

import UIKit

extension UIFont{
    static var appFontNameReg : String {
        get{
            return "app-font-reg".localized()
        }
    }
    static var appFontNameBold : String {
        get{
            return "app-font-bold".localized()
        }
    }
    
    class func appRegularFontWith(size: CGFloat) -> UIFont{
        return  UIFont(name: appFontNameReg, size: size)!
    }
    
    class func appBoldFontWith(size: CGFloat) -> UIFont{
        return  UIFont(name: appFontNameBold, size: size)!
    }

}
