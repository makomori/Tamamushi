//
//  UIColor+hex.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/08/26.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit

extension UIColor {
    /// - Parameter hex: The base HEX string to create the color.
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let noHashString = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: noHashString)
        scanner.charactersToBeSkipped = CharacterSet.symbols
        
        var hexInt: UInt32 = 0
        if (scanner.scanHexInt32(&hexInt)) {
            let red = (hexInt >> 16) & 0xFF
            let green = (hexInt >> 8) & 0xFF
            let blue = (hexInt) & 0xFF
            
            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        } else {
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
