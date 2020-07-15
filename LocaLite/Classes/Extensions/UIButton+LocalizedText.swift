//
//  UIButton+LocalizedText.swift
//  Diplomat-iOS
//
//  Created by Leah Vogel on 5/21/17.
//  Copyright © 2017 BA Link. All rights reserved.
//

import UIKit

extension UIButton {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let title = self.currentTitle, title != "" {
            self.setTitle(title.localized(), for: .normal)
        }
    }
}
