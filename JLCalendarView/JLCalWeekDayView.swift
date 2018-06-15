//
//  JLCalWeekDayView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalWeekDayView: UIView, JLCalWeekDay {

    var dayViews = [] as NSMutableArray
    public var calManager: JLCalManager?{
        didSet{
            self.reload()
        }
    }
    
    func reload() {
        
        if dayViews.count == 0 {
            for _ in 0 ..< 7 {
                let label = UILabel()
                label.textAlignment = .center
                label.textColor = .black
                label.font = UIFont.systemFont(ofSize: (calManager?.settings.weekDayFontSize)!)
                
                self.addSubview(label)
                dayViews.add(label)
            }
        }
        
        let dateFormatter = calManager?.dateHelper.dateFormatter
        var days:[String] = []
        
        let weekDayFormat = calManager?.settings.weekDayFormat
        switch weekDayFormat! {
        case .single:
            days = (dateFormatter?.veryShortStandaloneWeekdaySymbols)!
            break
        case .short:
            days = (dateFormatter?.shortStandaloneWeekdaySymbols)!
            break
        case .full:
            days = (dateFormatter?.standaloneWeekdaySymbols)!
            break
        }
        
        let firstWeekday = ((calManager?.dateHelper.calendar.firstWeekday)! + 6) % 7
        for _ in 0 ..< firstWeekday {
            let day = days.first
            days.remove(at: 0)
            days.append(day!)
        }
        
        for i in 0 ..< 7 {
            let label = dayViews[i] as! UILabel
            label.text = days[i]
        }
    }
    
    public override func layoutSubviews() {
        if dayViews.count == 0 {return}
        
        var x : CGFloat = 0.0
        let dayWidth = self.frame.size.width / 7
        let dayHeight = self.frame.size.height
        
        for view in dayViews {
            (view as! UIView).frame = CGRect.init(x: x, y: 0, width: dayWidth, height: dayHeight)
            x = x + dayWidth
        }
    }
}
