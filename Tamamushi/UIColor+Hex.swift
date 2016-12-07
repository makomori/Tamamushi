//
//  UIColor+hex.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/08/26.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit

extension UIColor {
    class func hexStr (_ hexStr : NSString, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr, alpha = alpha
        hexStr = hexStr.replacingOccurrences(of: "#", with: "") as NSString
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.white;
        }
    }
}
