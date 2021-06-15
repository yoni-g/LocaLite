//
//  UIFont+CustomFonts.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 05/06/2019.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
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
    
    class func appRegularFont(with size: CGFloat) -> UIFont{
        return  UIFont(name: appFontNameReg, size: size)!
    }
    
    class func appBoldFont(with size: CGFloat) -> UIFont{
        return  UIFont(name: appFontNameBold, size: size)!
    }

}
