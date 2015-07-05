//
//  ScheduleType3.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

class ScheduleType3: ScheduleType {
    
    init() {
        super.init(name: "Режим номер 3")
        times = [TimeItem(hour: 8), TimeItem(hour: 13), TimeItem(hour: 18), TimeItem(hour: 22)]
    }
}
