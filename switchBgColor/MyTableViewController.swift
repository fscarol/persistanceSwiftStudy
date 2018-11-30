//
//  MyTableViewController.swift
//  switchBgColor
//
//  Created by Ana Caroline Freitas Sampaio on 22/11/2018.
//  Copyright © 2018 Ana Caroline Freitas Sampaio. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    @IBOutlet var switchCollection: [UISwitch]!
    
    let defaults = UserDefaults.standard
    let zeroSwitch = 0
    var colorKey = "switchOn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.integer(forKey: colorKey)
        let color = defaults.integer(forKey: colorKey)
        
        for item in switchCollection {
            if item.tag == color {
                item.isOn = true
                self.view.backgroundColor = item.onTintColor
            } else {
                item.isOn = false
            }
        }
    }

    @IBAction func interactSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            sender.isOn = false
            self.view.backgroundColor = .white
            defaults.set(zeroSwitch, forKey: colorKey)
        } else {
            sender.isOn = true
            self.view.backgroundColor = sender.onTintColor
            
            defaults.set(sender.tag, forKey: colorKey)
            
            
            for item in switchCollection {
                if sender.tag != item.tag {
                    item.isOn = false
                }
            }
        }
    }
}
