//
//  UITextField+LocalizedText.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 5/21/17.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import UIKit

extension UITextField {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let placeholderText = self.placeholder, placeholderText != ""{
            self.placeholder = placeholderText.localized()
        }
        if LocaLite.shared.isRtl(){
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
    }
    
    @objc var substituteFontName : String {
        get {
            self.font!.fontName
        }
        set {
            self.font = UIFont(name: newValue, size: (self.font?.pointSize)!)
        }
    }
}
