//
//  UIView+Semantic.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 20/06/2019.
//  Copyright © 2020 Yonathan Goriachnick All rights reserved.
//

import UIKit

extension UIView{
    open override func awakeFromNib() {
        super.awakeFromNib()
        if LocaLite.shared.isRtl() && !isForceLTRSemanticView(){
            self.semanticContentAttribute = .forceRightToLeft
        } else {
            self.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    private func isForceLTRSemanticView() -> Bool {

        let viewName = self.restorationIdentifier ?? String(describing: type(of: self))
        return LocaLite.shared.forceLTRViews?.contains(viewName) ?? false
    }
}
