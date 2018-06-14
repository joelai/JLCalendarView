//
//  ViewController.swift
//  JLCalendarViewDemo
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit
import JLCalendarView

class ViewController: UIViewController, JLCalViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = false
        
        let manager = JLCalManager()
        manager.delegate = self
        let calPage = JLCalMonthView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0))
        calPage.calManager = manager
        self.view.addSubview(calPage)
        calPage.date = Date()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

