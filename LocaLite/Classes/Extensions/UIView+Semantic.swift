//
//  UIView+Semantic.swift
//  Diplomat-iOS
//
//  Created by Yoni770 on 20/06/2019.
//  Copyright © 2019 BA Link. All rights reserved.
//

import UIKit

extension UIView{
    open override func awakeFromNib() {
        super.awakeFromNib()
        if LocalizationUtils.isRtl() && !isForceLTRSemanticView(){
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
        //print(self.accessibilityLabel)
        guard let accessibilityLabel = self.accessibilityLabel else {
            return LocalizationUtils.forceLTRViews.contains(String(describing: type(of: self)))
        }

        return LocalizationUtils.forceLTRViews.contains(accessibilityLabel)
    }
}
