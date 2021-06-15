//
//  UISegmentedControl+LocalizedText.swift
//  LocaLite
//
//  Created by Yonathan Goriachnick on 5/21/17.
//  Copyright © 2020 Yonathan Goriachnick. All rights reserved.
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
