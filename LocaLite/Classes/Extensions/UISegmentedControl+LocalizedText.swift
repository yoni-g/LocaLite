//
//  UISegmentedControl+LocalizedText.swift
//  Diplomat-iOS
//
//  Created by Leah Vogel on 5/21/17.
//  Copyright © 2017 BA Link. All rights reserved.
//

import UIKit

extension UISegmentedControl{
    open override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0..<self.numberOfSegments{
            if let _title = self.titleForSegment(at: i), _title != "" {
                self.setTitle(_title.localized(), forSegmentAt: i)
            }
        }
    }
}
