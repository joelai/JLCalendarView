//
//  JLCalMonthView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalMonthView: UIView, JLCalMonth {

    public var calManager: JLCalManager?
    var titleView : UIView?
    var weekDayView : UIView?
    var weekViews = [] as NSMutableArray
    
    public var date: Date? {
        didSet {
            self.reload()
        }
    }
    
    public func reload()
    {
        var height: CGFloat = 0.0
        height = height + (calManager?.settings.titleHeight)!
        height = height + (calManager?.settings.weekDayHeight)!
        
        if titleView == nil {
            titleView = calManager?.buildTitleView()
            (titleView as! JLCalTitle).calManager = self.calManager
            (titleView as! JLCalTitle).date = self.date
            self.calManager?.delegate?.prepareTitleView?((titleView)!, manager: self.calManager!)
            self.addSubview(titleView!)
        }
        if weekDayView == nil {
            weekDayView = calManager?.buildWeekDayView()
            (weekDayView as! JLCalWeekDay).calManager = self.calManager
            self.calManager?.delegate?.prepareWeekDayView?(weekDayView!, manager: self.calManager!)
            self.addSubview(weekDayView!)
        }
        
        var weeks = 6 // max weeks of a month
        var weekDate = calManager?.dateHelper.firstWeekDayOfMonth(self.date!)
        if calManager?.settings.calViewPageType == .week {
            weeks = 1
            weekDate = calManager?.dateHelper.firstWeekDayOfWeek(self.date!)
        }
        
        
        if weekViews.count == 0 {
            for _ in 0 ..< weeks {
                let weekView = calManager?.buildWeekView()
                (weekView as! JLCalWeek).calManager = self.calManager
                self.addSubview(weekView!)
                weekViews.add(weekView!)
            }
        }
        var startDate = weekDate
        for weekView in weekViews {
            if (calManager?.dateHelper.weekHasDaysInSameMonthOfDay(weekDay: startDate!, compare: self.date!))! {
                (weekView as! JLCalWeek).config(startDate: startDate!, currentMonth: self.date!)
                self.calManager?.delegate?.prepareWeekView?(weekView as! UIView, manager: self.calManager!)
                startDate = startDate?.addWeek(1)
                height = height + (calManager?.settings.weekHeight)!
                (weekView as! UIView).isHidden = false
            }else{
                (weekView as! UIView).isHidden = true
            }
        }
        
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    public override func layoutSubviews() {
        if weekViews.count == 0 {return}
        
        var y : CGFloat = 0.0
        let viewWidth = self.frame.size.width
        let titleHeight = calManager?.settings.titleHeight
        titleView?.frame = CGRect.init(x: 0, y: y, width: viewWidth, height: titleHeight!)
        y = y + titleHeight!
        
        let weekDayHeight = calManager?.settings.weekDayHeight
        weekDayView?.frame = CGRect.init(x: 0, y: y, width: viewWidth, height: weekDayHeight!)
        y = y + weekDayHeight!
        
        let weekHeight = calManager?.settings.weekHeight
        
        for weekView in weekViews {
            (weekView as! UIView).frame = CGRect.init(x: 0, y: y, width: viewWidth, height: weekHeight!)
            y = y + weekHeight!
        }
    }
}
