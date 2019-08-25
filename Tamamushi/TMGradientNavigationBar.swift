//
//  TMGradientNavigationBar.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/12/06.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit

// Gradient color direction
public enum Direction {
    case vertical
    case horizontal
}

public class TMGradientNavigationBar: NSObject {
    private var gradientColors:[TMColor] = []

    public override init() {
        super.init()
        loadColors()
    }

    public func setInitialBarGradientColor(direction: Direction, typeName: String) {
        if let gradientColor = gradientColorWithName(name: typeName) {
            let image = generateGradientImage(direction: direction, startColor: gradientColor.color.start, endColor: gradientColor.color.end)
            setInitialImageToNavigationBar(image: image)
        }
    }

    public func setInitialBarGradientColor(direction: Direction, startColor: UIColor, endColor: UIColor) {
        let image = generateGradientImage(direction: direction, startColor: startColor, endColor: endColor)
        setInitialImageToNavigationBar(image: image)
    }

    public func setGradientColorOnNavigationBar(bar: UINavigationBar, direction: Direction, typeName: String) {
        if let gradientColor = gradientColorWithName(name: typeName) {
            let image = generateGradientImage(direction: direction, startColor: gradientColor.color.start, endColor: gradientColor.color.end)
            bar.setBackgroundImage(image, for: .default)
        }
    }

    // Method to set navigationBar gradient from UIViewController which has NavigationBar
    public func setGradientColorOnNavigationBar(bar: UINavigationBar, direction: Direction, startColor: UIColor, endColor: UIColor) {
        let image = generateGradientImage(direction: direction, startColor: startColor, endColor: endColor)
        bar.setBackgroundImage(image, for: .default)
    }

    // Extract gradient color with the name specified
    private func gradientColorWithName(name: String) -> TMColor? {
        let matchedGradientColors = gradientColors.filter { $0.name == name }
        if matchedGradientColors.count > 0 {
            return matchedGradientColors.first
        } else {
            print("specified type name doesn't match any of the gradient colors")
            return nil
        }
    }

    // Create UIImage with the gradient specified
    private func generateGradientImage(direction: Direction, startColor: UIColor, endColor: UIColor) -> UIImage {
        let gradientLayer = CAGradientLayer()
        let sizeLength = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let navBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: UINavigationController.navigationBarHeight())
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

    // Method to set image from AppDelegate
    private func setInitialImageToNavigationBar(image: UIImage) {
        UINavigationBar.appearance().setBackgroundImage(image, for: .default)
    }

    // Load gradient colors form json file
    private func loadColors() {
        guard let path = Bundle(for: TMGradientNavigationBar.self).path(forResource: "gradients", ofType: "json") else {
            print("error occured")
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let _colors = try? JSONDecoder().decode([TMColor].self, from: data) else {
                print("no json file found")
                return
        }
        
        gradientColors = _colors
    }
}

extension UINavigationController {
    static public func navigationBarHeight() -> CGFloat {
        let nc = UINavigationController(rootViewController: UIViewController(nibName: nil, bundle: nil))
        return nc.navigationBar.bounds.height + max(UIApplication.shared.statusBarFrame.height, 44.0)
    }
}
