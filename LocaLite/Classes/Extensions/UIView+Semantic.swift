//
//  UIView+Semantic.swift
//  LocaLite
//
//  Created by Yoni770 on 20/06/2019.
//  Copyright © 2020 Yonathan Goriachnick All rights reserved.
//

import UIKit

extension UIView{
    open override func awakeFromNib() {
        super.awakeFromNib()
        if LocaLite.shared.isRtl() && !isForceLTRSemanticView(){
            self.semanticContentAttribute = .forceRightToLeft
        } else {
//            print(self.accessibilityLabel)
            self.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    private func isForceLTRSemanticView() -> Bool {
        // TODO: 
        if String(describing: type(of: self)) == "UITableView"{
            return false
        }
        return LocaLite.shared.forceLTRViews?.contains(String(describing: type(of: self))) ?? false
        //print(self.accessibilityLabel)
//        guard let accessibilityLabel = self.accessibilityLabel else {
//            return LocaLite.shared.forceLTRViews.contains(String(describing: type(of: self)))
//        }
//
//        return LocaLite.shared.forceLTRViews.contains(accessibilityLabel)
    }
}
