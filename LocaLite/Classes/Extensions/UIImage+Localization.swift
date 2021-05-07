//
//  UIImage+Localization.swift
//  LocaLite
//
//  Created by Yoni on 15/07/2019.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import UIKit

extension UIImage{
    public func setLocalizedDirection() -> UIImage{
        if LocaLite.shared.isRtl() {
            if #available(iOS 10.0, *) {
                return self.withHorizontallyFlippedOrientation()
            } else {
                // Fallback on earlier versions
            }
//            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        return self
    }
}
