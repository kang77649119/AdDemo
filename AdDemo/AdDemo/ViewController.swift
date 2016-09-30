//
//  ViewController.swift
//  AdDemo
//
//  Created by 也许、 on 16/9/28.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "首页"
        self.view.addSubview(label)
        
    }


}

