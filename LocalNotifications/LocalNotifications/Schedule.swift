//
//  Schedule.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

class Schedule {
    
    static let sharedInstance = Schedule()
    
    let items: [ScheduleType]
    
    init(){
       items = [ScheduleType1(), ScheduleType2(), ScheduleType3()]
    }
    
    var selectedSchedule: ScheduleType {
        
        let item = items.firstOrDefault{$0.selected}
        
        if item != nil {
            return item!
        }
        return items[0]
    }
    
}