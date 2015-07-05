//
//  ScheduleType1.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

class ScheduleType1: ScheduleType {
    
    init() {
        super.init(name: "Режим номер 1")
        selected = true
        times = [TimeItem(hour: 10), TimeItem(hour: 22)]
    }
}


