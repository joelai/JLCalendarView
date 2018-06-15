//
//  JLCalManager.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import Foundation
import UIKit

@objc public class JLCalManager : NSObject {
    public weak var delegate:JLCalViewDelegate?
    public var dateHelper: JLCalDateHelper
    public var settings: JLCalSettings
    
    override public init() {
        dateHelper = JLCalDateHelper()
        settings = JLCalSettings()
    }
    
    public func buildDayView() -> UIView {
        if let view = self.delegate?.buildDayView?(self) {
            if let v = view as? JLCalDay {
                return v as! UIView
            }
        }
        return JLCalDayView()
    }
    
    public func buildTitleView() -> UIView {
        if let view = self.delegate?.buildTitleView?(self) {
            if let v = view as? JLCalTitle {
                return v as! UIView
            }
        }
        return JLCalTitleView()
    }
    
    public func buildWeekDayView() -> UIView {
        if let view = self.delegate?.buildWeekDayView?(self) {
            if let v = view as? JLCalWeekDay {
                return v as! UIView
            }
        }
        return JLCalWeekDayView()
    }
    
    public func buildWeekView() -> UIView {
        if let view = self.delegate?.buildWeekView?(self) {
            if let v = view as? JLCalWeek {
                return v as! UIView
            }
        }
        return JLCalWeekView()
    }
    
}
