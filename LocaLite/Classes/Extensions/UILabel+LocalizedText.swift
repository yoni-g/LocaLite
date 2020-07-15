//
//  UILabel+LocalizedText.swift
//  Diplomat-iOS
//
//  Created by Leah Vogel on 5/21/17.
//  Copyright © 2017 BA Link. All rights reserved.
//

import UIKit

extension UILabel{
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let _text = self.text, _text != ""{
            self.text = _text.localized()
        }
    }
    
    @objc var substituteFontName : String {
        get { return self.font.fontName }
        set {
            if !self.font.fontName.contains("Medium") {
                self.font = UIFont(name: newValue, size: self.font.pointSize)
            }
        }
    }
    
    @objc var substituteFontNameBold : String {
        get { return self.font.fontName }
        set {
            if self.font.fontName.contains("Medium") || self.font.fontName.contains("Bold"){
                self.font = UIFont(name: newValue, size: self.font.pointSize)
            }
        }
    }
    
}
