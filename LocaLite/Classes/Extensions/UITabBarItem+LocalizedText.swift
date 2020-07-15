//
//  UITabBarItem+LocalizedText.swift
//  Diplomat-iOS
//
//  Created by Leah Vogel on 5/21/17.
//  Copyright © 2017 BA Link. All rights reserved.
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
