//
//  TimeItem.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

class TimeItem {
    
    let time: NSDate;
    
    init(hour: Int){
        time = NSDate(hour: hour)
    }
    
    func toString() -> String {
        
        return time.toString(format: "HH:mm")
    }
}
