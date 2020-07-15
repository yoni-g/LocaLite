//
//  UITextField+LocalizedText.swift
//  Diplomat-iOS
//
//  Created by Leah Vogel on 5/21/17.
//  Copyright © 2017 BA Link. All rights reserved.
//

import UIKit

extension UITextField {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let placeholderText = self.placeholder, placeholderText != ""{
            self.placeholder = placeholderText.localized()
        }
        if LocalizationUtils.isRtl(){
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
    }
    
    @objc var substituteFontName : String {
        get { return self.font!.fontName }
        set {
            self.font = UIFont(name: newValue, size: (self.font?.pointSize)!)
        }
    }
}
