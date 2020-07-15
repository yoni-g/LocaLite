//
//  UIImage+Localization.swift
//  Diplomat-iOS
//
//  Created by Yoni on 15/07/2019.
//  Copyright © 2019 BA Link. All rights reserved.
//

import UIKit

extension UIImage{
    func setLocalizedDirection() -> UIImage{
        if(LocalizationUtils.isRtl()){
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
