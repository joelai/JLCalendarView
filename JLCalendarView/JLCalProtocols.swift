//
//  JLCalProtocols.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol JLCalDay : NSObjectProtocol {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
    var isFromOtherMonth:Bool{get set}
    func reload()
}
extension JLCalDay where Self: UIView {}


@objc public protocol JLCalWeek : NSObjectProtocol {
    var calManager:JLCalManager?{get set}
    func config(startDate:Date, currentMonth:Date)
}
extension JLCalWeek where Self: UIView {}


@objc public protocol JLCalWeekDay : NSObjectProtocol {
    var calManager:JLCalManager?{get set}
}
extension JLCalWeekDay where Self: UIView {}


@objc public protocol JLCalMonth : NSObjectProtocol {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
    func reload()
}
extension JLCalMonth where Self: UIView {}

@objc public protocol JLCalTitle : NSObjectProtocol {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
}
extension JLCalTitle where Self: UIView {}

@objc public protocol JLCalContent : NSObjectProtocol {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
}
extension JLCalContent where Self: UIView {}



@objc public protocol JLCalViewDelegate : NSObjectProtocol
{
    @objc optional func buildDayView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareDayView(_ view:UIView, manager:JLCalManager)
    
    @objc optional func buildWeekDayView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareWeekDayView(_ view:UIView, manager:JLCalManager)
    
    @objc optional func buildWeekView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareWeekView(_ view:UIView, manager:JLCalManager)
    
    @objc optional func buildTitleView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareTitleView(_ view:UIView, manager:JLCalManager)
    
    @objc optional func buildMonthView(_ view:UIView, manager:JLCalManager) -> UIView
    @objc optional func prepareMonthView(_ view:UIView, manager:JLCalManager)
    
}
