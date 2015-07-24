//
//  NotificationFactory.swift
//  LocalNotifications
//
//  Created by Serjo on 23/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import UIKit

class NotificationFactory {
    
    static let sharedInstance = NotificationFactory()
    
    private init(){}
    
    func registerNotificateions() {
        
        let notificateionTypes: UIUserNotificationType = .Sound | .Alert | .Badge
        
        let category = createCategory()

        let settings = UIUserNotificationSettings(forTypes: notificateionTypes, categories: [category])
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    func stopNotification(){
        
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    func scheduleNotification(#fireDate: NSDate) {
        
        let notification = UILocalNotification()
        notification.fireDate = fireDate
        notification.timeZone = NSCalendar.currentCalendar().timeZone
        
        notification.alertBody = "Необходимо подкрутить аппарат"
        notification.repeatInterval = NSCalendarUnit.CalendarUnitMinute
        notification.hasAction = true
        notification.category = CategoryType.notification.rawValue
        notification.alertAction = "Подкрутить аппарат"
        //        notification.soundName = "NightOwl.m4r"
        notification.soundName = UILocalNotificationDefaultSoundName
        //notification.applicationIconBadgeNumber++
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    private func createCategory() -> UIMutableUserNotificationCategory {
        
        let snoozeAction = createAction(ActionType.snooze, actionName: "Отложить")
        let completeAction = createAction(ActionType.complete, actionName: "Готово")
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = CategoryType.notification.rawValue
        category.setActions([snoozeAction, completeAction], forContext: .Minimal)
        category.setActions([snoozeAction, completeAction], forContext: .Default)
        
        return category
    }
    
    private func createAction(actionType: ActionType, actionName: String) -> UIMutableUserNotificationAction {
        
        let action = UIMutableUserNotificationAction()
        action.identifier = actionType.rawValue
        action.title = actionName
        action.activationMode = UIUserNotificationActivationMode.Background
        action.authenticationRequired = true
        action.destructive = false
        
        return action
    }
    
}
