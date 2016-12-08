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
}

public class TMGradientNavigationBar: NSObject {
    private var gradientColors:[TMColor] = []

    public func setBarGradientColor(direction: Direction, typeName: String) {
        loadColors()
        let matchedGradientColors = gradientColors.filter { $0.name == typeName }
        if matchedGradientColors.count > 0 {
            let gradientColor = matchedGradientColors[0]
            if let startColor = gradientColor.startColor, let endColor = gradientColor.endColor {
                setBacrGradientColor(direction: direction, startColor: startColor, endColor: endColor)
            } else {
                print("colors are not specified in JSON file")
            }
        } else {
            print("specified type name doesn't match any of the gradient colors")
        }
    }

    public func setBacrGradientColor(direction: Direction, startColor: UIColor, endColor: UIColor) {
        let image = generateGradientImage(direction: direction, startColor: startColor, endColor: endColor)
        setImageToNavigationBar(image: image)
    }

    public func generateGradientImage(direction: Direction, startColor: UIColor, endColor: UIColor) -> UIImage {
        let gradientLayer = CAGradientLayer()
        let sizeLength = UIScreen.main.bounds.size.height * 2
        let navBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: 64)
        gradientLayer.frame = navBarFrame
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]

        if direction == .horizontal {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.3, y: 0.5)
        }

        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }

    private func setImageToNavigationBar(image: UIImage) {
        UINavigationBar.appearance().isOpaque = false
        UINavigationBar.appearance().setBackgroundImage(image, for: .default)
    }

    private func loadColors() {
        if let path = Bundle.init(for: TMGradientNavigationBar.self).path(forResource: "gradients", ofType: "json") {
            do {
                let data = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                if let parsedData = try? JSONSerialization.jsonObject(with: data as Data) as! [[String: Any]] {
                    parsedData.forEach({ (eachData) in
                        let name = eachData["name"] as! String
                        var colors = eachData["colors"] as! [String]
                        let startColor = UIColor.hexStr(colors[0] as NSString, alpha: 1.0)
                        let endColor = UIColor.hexStr(colors[1] as NSString, alpha: 1.0)
                        let gradientColor = TMColor(startColor: startColor, endColor: endColor, name: name)
                        gradientColors.append(gradientColor)
                    })
                }
            } catch {
                print("error occured")
            }
        } else {
            print("no json file found")
        }
    }
}
