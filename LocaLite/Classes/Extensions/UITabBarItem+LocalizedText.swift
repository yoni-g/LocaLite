//
//  UITabBarItem+LocalizedText.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 5/21/17.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import UIKit

extension UITabBarItem{
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let _title = self.title{
            self.title = _title.localized()
        }
    }
}
