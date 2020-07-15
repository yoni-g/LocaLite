//
//  UINavigationItem+Localized.swift
//  Diplomat-iOS
//
//  Created by Yonathan Goriachnick on 26/12/2019.
//  Copyright © 2019 Diplomat. All rights reserved.
//

import UIKit

extension UINavigationItem{
	open override func awakeFromNib() {
		super.awakeFromNib()
		if let _title = self.title, _title != "" {
            self.title = _title.localized()
		}
	}
}

