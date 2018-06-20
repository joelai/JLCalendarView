//
//  JLCalDateHelper.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import Foundation

extension Date {

    public func addMonth(_ months: NSInteger) -> Date {
        var components = DateComponents()
        components.month = months
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func addWeek(_ weeks: NSInteger) -> Date {
        var components = DateComponents()
        components.day = 7 * weeks
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func addDay(_ days: NSInteger) -> Date {
        var components = DateComponents()
        components.day = days
        return Calendar.current.date(byAdding: components, to: self)!
    }
    
    public func isSameMonthAs(_ date: Date) -> Bool {
        let componentsSelf = Calendar.current.dateComponents([.year,.month], from: self)
        let componentsDate = Calendar.current.dateComponents([.year,.month], from: date)
        return componentsSelf.year == componentsDate.year && componentsSelf.month == componentsDate.month
    }
    
    public func isSameWeekAs(_ date: Date) -> Bool {
        let componentsSelf = Calendar.current.dateComponents([.year,.weekOfYear], from: self)
        let componentsDate = Calendar.current.dateComponents([.year,.weekOfYear], from: date)
        return componentsSelf.year == componentsDate.year && componentsSelf.weekOfYear == componentsDate.weekOfYear
    }
    
    public func isSameDayAs(_ date: Date) -> Bool {
        let componentsSelf = Calendar.current.dateComponents([.year,.month,.day], from: self)
        let componentsDate = Calendar.current.dateComponents([.year,.month,.day], from: date)
        return componentsSelf.year == componentsDate.year && componentsSelf.month == componentsDate.month && componentsSelf.day == componentsDate.day
    }
    
    public func isBefore(_ date: Date) -> Bool {
        return self.compare(date) == .orderedAscending
    }
    
    public func isAfter(_ date: Date) -> Bool {
        return self.compare(date) == .orderedDescending
    }
    
    public func isEqualOrBeforeDay(_ date: Date) -> Bool {
        return isBefore(date) || isSameDayAs(date)
    }
    
    public func isEqualOrAfterDay(_ date: Date) -> Bool {
        return isAfter(date) || isSameDayAs(date)
    }
    
    public func isBetween(firstDate: Date, lastDate: Date) -> Bool {
        return isEqualOrAfterDay(firstDate) && isEqualOrBeforeDay(lastDate)
    }
}

@objc public class JLCalDateHelper : NSObject {
    public var calendar : Calendar
    public var dateFormatter : DateFormatter
    
    override init() {
        calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        calendar.locale = NSLocale.current
        calendar.firstWeekday = 2
        dateFormatter = DateFormatter()
        dateFormatter.timeZone = self.calendar.timeZone
        dateFormatter.locale = self.calendar.locale
    }
    
    public func firstDayOfMonth(_ date: Date) -> Date {
        let componentsDate = self.calendar.dateComponents([.year,.month,.day,.weekday,.weekOfMonth], from: date)
        var componentsNewDate = DateComponents()
        componentsNewDate.year = componentsDate.year
        componentsNewDate.month = componentsDate.month
        componentsNewDate.weekOfMonth = 1
        componentsNewDate.day = 1
        
        return self.calendar.date(from: componentsNewDate)!
    }
    
    public func lastDayOfMonth(_ date: Date) -> Date {
        let componentsDate = self.calendar.dateComponents([.year,.month,.day,.weekday,.weekOfMonth], from: date)
        var componentsNewDate = DateComponents()
        componentsNewDate.year = componentsDate.year
        componentsNewDate.month = componentsDate.month! + 1
        componentsNewDate.day = 0
        
        return self.calendar.date(from: componentsNewDate)!
    }
    
    public func numberOfWeeks(_ date: Date) -> NSInteger {
        let firstDay = firstDayOfMonth(date)
        let lastDay = lastDayOfMonth(date)
        
        var componentsA = self.calendar.dateComponents([.weekOfYear], from: firstDay)
        var componentsB = self.calendar.dateComponents([.weekOfYear], from: lastDay)
        
        if componentsB.weekOfYear == 53 {
            componentsB.weekOfYear = 0
        }
        if componentsA.weekOfYear == 53 {
            componentsA.weekOfYear = 0
        }
        
        return (componentsB.weekOfYear! - componentsA.weekOfYear! + 52 + 1)%52
    }

    public func firstWeekDayOfWeek(_ date: Date) -> Date {
        let componentsDate = self.calendar.dateComponents([.year,.month,.day,.weekday,.weekOfMonth], from: date)
        var componentsNewDate = DateComponents()
        componentsNewDate.year = componentsDate.year
        componentsNewDate.month = componentsDate.month
        componentsNewDate.weekOfMonth = componentsDate.weekOfMonth
        componentsNewDate.weekday = self.calendar.firstWeekday
        
        return self.calendar.date(from: componentsNewDate)!
    }
    
    public func firstWeekDayOfMonth(_ date:Date) -> Date {
        let dayOfMonth = firstDayOfMonth(date)
        return firstWeekDayOfWeek(dayOfMonth)
    }
    
    public func lastWeekDayOfWeek(_ date: Date) -> Date {
        let nextWeek = date.addWeek(1)
        let nextFirstDay = firstWeekDayOfWeek(nextWeek)
        return nextFirstDay.addDay(-1)
    }
    
    public func isFirstDayOfWeek(_ date: Date) -> Bool {
        let firstDay = firstWeekDayOfWeek(date)
        return date.isSameDayAs(firstDay)
    }
    
    public func isLastDayOfWeek(_ date: Date) -> Bool {
        let lastDay = lastWeekDayOfWeek(date)
        return date.isSameDayAs(lastDay)
    }
    
    public func isFirstDayOfMonth(_ date: Date) -> Bool {
        let firstDay = firstDayOfMonth(date)
        return date.isSameDayAs(firstDay)
    }
    
    public func isLastDayOfMonth(_ date: Date) -> Bool {
        let lastDay = lastDayOfMonth(date)
        return date.isSameDayAs(lastDay)
    }
    
    public func weekHasDaysInSameMonthOfDay(weekDay:Date, compare:Date) -> Bool {
        var day = firstWeekDayOfWeek(weekDay)
        for _ in 0 ..< 7 {
            if day.isSameMonthAs(compare) {
                return true
            }
            day = day.addDay(1)
        }
        return false
    }
    
    public func isSameDay(_ date:Date, asDate:Date) -> Bool {
        return date.isSameDayAs(asDate)
    }
    
    public func isDay(_ date:Date, betweenDate:Date, andDate:Date) -> Bool {
        return date.isBetween(firstDate: betweenDate, lastDate: andDate)
    }
}
