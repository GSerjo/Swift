//
//  ArrayExtensions.swift
//  LocalNotifications
//
//  Created by Serjo on 25/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation

extension Array {
    
    func firstOrDefault(pridicate: (T) -> Bool) -> T? {
        
        for item in self {
            
            if(pridicate(item)) {
                return item
            }
        }
        return .None
    }
}