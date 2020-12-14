//
//  UIColor+Extension.swift
//  LabOnClick
//
//  Created by Mustafa Ezzat on 7/11/19.
//  Copyright © 2019 Waqood. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    //static let successColor = UIColor.init(red: 235/255, green: 73/255, blue: 24/255, alpha: 1)
    static let Navigation = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
    static let connectionColor = UIColor(red: 17/255, green: 165/255, blue: 191/255, alpha: 1)
    static let noConnectionColor = UIColor(red: 235/255, green: 73/255, blue: 24/255, alpha: 1)
    static let mainColor = UIColor.init(rgb: 0x006937)
    static let mainColorWithAlpha = UIColor(rgb: 0x006937).withAlphaComponent(0.3)
    static let shadowColor = UIColor(red: 36, green: 36, blue: 36).withAlphaComponent(0.4)
    static let blackColor = UIColor.init(rgb: 0x3C3C3C)
    static let blackColorWithAlpha = UIColor.init(rgb: 0x3C3C3C).withAlphaComponent(0.8)
    static let lightGrayColor = UIColor(rgb: 0xF4F4F4)
    static let greenColorWithAlpha = UIColor(red: 125, green: 179, blue: 153).withAlphaComponent(0.1)
}
