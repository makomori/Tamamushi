//
//  TMGradientNavigationBar.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/12/06.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit


public enum Direction {
    case vertical
    case horizontal

    func startPoint() -> CGPoint {
        switch self {
        case .vertical: return CGPoint(x:0, y:0)
        case .horizontal: return CGPoint(x:0, y:0)
        }
    }

    func endPoint() -> CGPoint {
        switch self {
        case .vertical: return CGPoint(x:0, y:0)
        case .horizontal: return CGPoint(x:0, y:0)
        }
    }
}

public class TMGradientNavigationBar: NSObject {
    var colors:[TMColor] = []

    public func setBarGradientColor(direction: Direction, typeName: String) {
    }

    public func setBacrGradientColor(direction: Direction, startColor: UIColor, endColor: UIColor) {
        UINavigationBar().setBackgroundImage(generateGradientImage(startColor: startColor, endColor: endColor), for: .default)
    }

    func generateGradientImage(startColor: UIColor, endColor: UIColor) -> UIImage {
        let gradientLayer = CAGradientLayer()
        let width = UIScreen.main.bounds.size.width
        let navBarFrame = CGRect(x: 0, y: 0, width: width, height: 64)
        gradientLayer.frame = navBarFrame
        gradientLayer.colors = [startColor, endColor]

        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }

    func loadColors() {
        if let path = Bundle.main.path(forResource: "gradients", ofType: "json") {
            do {
                let data = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
//                let json = JSON(data: data as Data)
//                json.array?.forEach({ (eachJson) in
//                    if let gradientColor = Mapper<GradientColor>().map(JSON: eachJson.dictionaryObject!) {
//                        gradientColors.append(gradientColor)
//                    }
//                })
//                collectionView?.reloadData()
                if let parsedData = try? JSONSerialization.jsonObject(with: data as Data) {
//                    print(parsedData["name"])
                }
            } catch {
                print("error occured")
            }
        }
    }
}
