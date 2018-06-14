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
    public var weekDayFormat: JLWeekDayFormat = .short
    public var calViewPageType: JLCalViewPageType = .month
    public var menuHeight: CGFloat = 30.0
    public var weekDayHeight: CGFloat = 30.0
    public var weekHeight: CGFloat = 50.0
}
