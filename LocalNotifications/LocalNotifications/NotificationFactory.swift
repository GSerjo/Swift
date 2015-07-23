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
    
    func registerNotificateions() {
        
        let notificateionTypes: UIUserNotificationType = .Sound | .Alert | .Badge
        
        let category = createCategory()

        let settings = UIUserNotificationSettings(forTypes: notificateionTypes, categories: [category])
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
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
