//
//  JLCalProtocols.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import Foundation
import UIKit

public protocol JLCalDay : class {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
    var isFromOtherMonth:Bool{get set}
    func reload()
}
extension JLCalDay where Self: UIView {}


public protocol JLCalWeek : class {
    var calManager:JLCalManager?{get set}
    func config(startDate:Date, currentMonth:Date)
}
extension JLCalWeek where Self: UIView {}


public protocol JLCalWeekDay : class {
    var calManager:JLCalManager?{get set}
}
extension JLCalWeekDay where Self: UIView {}


public protocol JLCalMonth : class {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
    func reload()
}
extension JLCalMonth where Self: UIView {}

public protocol JLCalMenu : class {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
}
extension JLCalMenu where Self: UIView {}

public protocol JLCalContent : class {
    var calManager:JLCalManager?{get set}
    var date:Date?{get set}
}
extension JLCalContent where Self: UIView {}



@objc public protocol JLCalViewDelegate : NSObjectProtocol
{
    @objc optional func buildDayView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareDayView(_ manager:JLCalManager)
    
    @objc optional func buildWeekDayView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareWeekDayView(_ manager:JLCalManager)
    
    @objc optional func buildWeekView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareWeekView(_ manager:JLCalManager)
    
    @objc optional func buildMenuView(_ manager:JLCalManager) -> UIView
    @objc optional func prepareMenuView(_ manager:JLCalManager)
    
    @objc optional func buildPageView(_ manager:JLCalManager) -> UIView
    
}
