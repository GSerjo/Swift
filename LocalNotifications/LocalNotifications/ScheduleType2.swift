//
//  ScheduleType2.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

class ScheduleType2: ScheduleType {
    
    init() {
        super.init(name: "Режим номер 2")
        times = [TimeItem(hour: 8), TimeItem(hour: 15)]
    }
}
