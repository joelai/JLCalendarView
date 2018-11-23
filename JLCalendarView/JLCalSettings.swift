//
//  JLCalSettings.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import Foundation

@objc public enum JLWeekDayFormat: Int {
    case single
    case short
    case full
}

@objc public enum JLCalViewPageType: Int {
    case week
    case month
}

@objc public class JLCalSettings : NSObject {
    @objc public var weekDayFormat: JLWeekDayFormat = .short
    @objc public var calViewPageType: JLCalViewPageType = .month
    @objc public var titleHeight: CGFloat = 30.0
    @objc public var titleFontSize: CGFloat = 14.0
    @objc public var weekDayHeight: CGFloat = 30.0
    @objc public var weekDayFontSize: CGFloat = 14.0
    @objc public var weekHeight: CGFloat = 40.0
    @objc public var dayFontSize: CGFloat = 16.0
    @objc public var dayViewCircleBackgroundColor: UIColor = .red
}
