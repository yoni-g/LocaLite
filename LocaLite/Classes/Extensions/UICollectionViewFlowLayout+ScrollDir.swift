//
//  UICollectionViewFlowLayout+ScrollDir.swift
//  LocaLite
//
//  Created by Yoni770 on 20/06/2019.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout {
    
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        if LocaLite.shared.isRtl(){
            return true
        }
        return false
    }
}
