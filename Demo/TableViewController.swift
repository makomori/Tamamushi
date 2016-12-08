//
//  TableViewController.swift
//  Tamamushi
//
//  Created by 母利 睦人 on 2016/12/08.
//  Copyright © 2016年 Femact Inc. All rights reserved.
//

import UIKit
import Tamamushi

class TableViewController: UITableViewController {

    @IBOutlet var directionSwitchButton: UIBarButtonItem!
    let colorNames = [
        "SoundCloud",
        "Facebook Messenger",
        "Instagram",
        "Flickr",
        "Vine",
        "YouTube",
        "Pinky",
        "Sunrise"
    ]
    var lastSelectedIndexPath = IndexPath(row: 0, section: 0)
    var gradientDirection = Direction.vertical

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func directionButtonTapped(_ sender: Any) {
        switch gradientDirection {
        case .vertical:
            gradientDirection = .horizontal
            directionSwitchButton.title = "vertical"
        case .horizontal:
            gradientDirection = .vertical
            directionSwitchButton.title = "horizontal"
        }
        if let bar = self.navigationController?.navigationBar {
            setGradientBarWithIndexPath(indexPath: lastSelectedIndexPath, onBar: bar)
        }
    }

    func setGradientBarWithIndexPath(indexPath: IndexPath, onBar: UINavigationBar) {
        TMGradientNavigationBar().setGradientColorOnNavigationBar(bar: onBar, direction: gradientDirection, typeName: colorNames[indexPath.row])
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = colorNames[indexPath.row]
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let bar = self.navigationController?.navigationBar {
            setGradientBarWithIndexPath(indexPath: indexPath, onBar: bar)
            lastSelectedIndexPath = indexPath
        }
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
