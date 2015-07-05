//
//  NSDateExtensions.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

public extension NSDate {
    
    private static func componentFlags() -> NSCalendarUnit {
        return NSCalendarUnit.CalendarUnitYear |
                NSCalendarUnit.CalendarUnitMonth |
                NSCalendarUnit.CalendarUnitDay |
                NSCalendarUnit.CalendarUnitWeekOfYear |
                NSCalendarUnit.CalendarUnitHour |
                NSCalendarUnit.CalendarUnitMinute |
                NSCalendarUnit.CalendarUnitSecond  |
                NSCalendarUnit.CalendarUnitWeekday |
                NSCalendarUnit.CalendarUnitWeekdayOrdinal |
                NSCalendarUnit.CalendarUnitWeekOfYear
    }
    
    private static func components(#fromDate: NSDate) -> NSDateComponents! {
        
        return NSCalendar.currentCalendar().components(NSDate.componentFlags(), fromDate: fromDate)
    }
    
    private func components() -> NSDateComponents  {
        
        return NSDate.components(fromDate: self)!
    }
    
    convenience init(hour:Int){
        
        let components = NSDate.components(fromDate: NSDate())
        
        var template = NSDateComponents()
        template.hour = hour
        template.year = components.year
        template.month = components.month
        template.day = components.day
        let sinceDate = NSCalendar.currentCalendar().dateFromComponents(template)!
        
        self.init(timeInterval:0, sinceDate: sinceDate)
    }
    
    public var year: Int {
        return self.components().year
    }
    
    public var month: Int {
        return self.components().month
    }
    
    public var weekOfYear: Int {
        return self.components().weekOfYear
    }
    
    public var weekday: Int {
        return self.components().weekday
    }
    
    public var day: Int {
        return self.components().day
    }
    
    public var hour: Int {
        return self.components().hour
    }
    
    public var minute: Int {
        return self.components().minute
    }
    
    public var second: Int {
        return self.components().second
    }
}