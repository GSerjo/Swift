//
//  AppDelegate.swift
//  LocalNotifications
//
//  Created by Serjo on 05/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var alarm: Alarm = Alarm.sharedInstance

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        NotificationFactory.sharedInstance.registerNotificateions()
        
        return true
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        
        if notificationSettings.types == nil {
            return
        }
        
        scheduleLocalNotification()
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        if(application.applicationState == UIApplicationState.Active){
            print("didReceiveLocalNotification foreground")
            alarm.play()
        }
        else {
            print("didReceiveLocalNotification background")
        }
    }
    
    func scheduleLocalNotification(){
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
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

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

