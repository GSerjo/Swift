//
//  ScheduleType.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

class ScheduleType {
    
    var selected: Bool = false
    let name: String
    var times: [TimeItem] = []
    
    init(name: String){
        self.name = name
    }
}
