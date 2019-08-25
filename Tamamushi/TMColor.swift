//
//  TMColor.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/12/06.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit

struct Color {
    let start: UIColor
    let end: UIColor
}

struct TMColor: Decodable {
    let name: String
    let color: Color
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        
        guard let _colors = try? values.decode([String].self, forKey: .colors), _colors.count == 2 else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.colors], debugDescription: "Expecting hex string representation of UIColor"))
        }
        
        color = Color(start: UIColor(hex: _colors[0]), end: UIColor(hex: _colors[1]))
    }
    
    enum CodingKeys: String, CodingKey {
        case name, colors
    }
}
