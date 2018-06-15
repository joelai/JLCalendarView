//
//  JLCalWeekView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalWeekView: UIView, JLCalWeek {
    var dayViews = [] as NSMutableArray
    public var calManager: JLCalManager?
    
    public func config(startDate: Date, currentMonth: Date) {
        if dayViews.count == 0 {
            for _ in 0 ..< 7 {
                let dayView = calManager?.buildDayView()
                (dayView as! JLCalDay).calManager = self.calManager
                self.addSubview(dayView!)
                dayViews.add(dayView!)
            }
        }
        var date = startDate
        for dayView in dayViews {
            (dayView as! JLCalDay).date = date
            (dayView as! JLCalDay).isFromOtherMonth = !date.isSameMonthAs(currentMonth)
            (dayView as! JLCalDay).reload()
            self.calManager?.delegate?.prepareDayView?(dayView as! UIView, manager: self.calManager!)
            date = date.addDay(1)
        }
    }
    
    public override func layoutSubviews() {
        if dayViews.count == 0 {
            return
        }
        var x : CGFloat = 0.0
        
        let dayWidth = self.frame.size.width / 7
        let dayHeight =  self.frame.size.height
        for dayView in dayViews {
            (dayView as! UIView).frame = CGRect.init(x: x, y: 0, width: dayWidth, height: dayHeight)
            x = x + dayWidth
        }
    }
}
