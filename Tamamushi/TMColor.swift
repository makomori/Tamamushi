//
//  TMColor.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/12/06.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit

struct TMColor {
    var startColor: UIColor!
    var endColor: UIColor!
    var name: String!

    init(startColor: UIColor, endColor: UIColor, name: String) {
        self.startColor = startColor
        self.endColor = endColor
        self.name = name
    }
}
