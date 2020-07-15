//
//  UICollectionViewFlowLayout+ScrollDir.swift
//  Diplomat-iOS
//
//  Created by Yoni770 on 20/06/2019.
//  Copyright © 2019 BA Link. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout {
    
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        if LocalizationUtils.isRtl(){
            return true
        }
        return false
    }
}
