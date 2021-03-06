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
        manager.settings.titleHeight = 44.0;
        manager.settings.weekDayHeight = 30.0;
        manager.settings.weekHeight = 50.0;
        manager.delegate = self
        let calPage = JLCalMonthView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0))
        calPage.calManager = manager
        self.view.addSubview(calPage)
        calPage.date = Date()
    }
    
    func buildDayView(_ manager: JLCalManager) -> UIView {
        return JLCalRangeDayView()
    }
    
    func prepareDayView(_ view: UIView, manager: JLCalManager) {
        if view is JLCalDayView {
            let dayView: JLCalDayView = view as! JLCalDayView
            dayView.circleView?.isHidden = !(dayView.date?.isSameDayAs(Date()))!
            if (dayView.date?.isSameDayAs(Date()))! {
                dayView.textLabel?.textColor = .white
            }else{
                dayView.textLabel?.textColor = .black
            }
        }else if view is JLCalRangeDayView {
            let dayView: JLCalRangeDayView = view as! JLCalRangeDayView
            manager.dateHelper.dateFormatter.dateFormat = "yyyy-MM-dd"
            let startDay = manager.dateHelper.dateFormatter.date(from: "2018-06-03")
            let endDay = manager.dateHelper.dateFormatter.date(from: "2018-06-16")
            if (dayView.date?.isBetween(firstDate: startDay!, lastDate: endDay!))! {
                if (dayView.date?.isSameDayAs(startDay!))! {
                    dayView.rangeView?.state = .startRange
                }
                else if (dayView.date?.isSameDayAs(endDay!))! {
                    dayView.rangeView?.state = .endRange
                }else {
                    dayView.rangeView?.state = .inRange
                }
                dayView.textLabel?.textColor = .white
            }else{
                dayView.textLabel?.textColor = .black
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

