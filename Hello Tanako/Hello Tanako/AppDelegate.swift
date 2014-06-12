//
//  AppDelegate.swift
//  Hello Tanako
//
//  Created by Serjo on 12/06/14.
//  Copyright (c) 2014 Serjo. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow
    @IBOutlet var btSay : NSButton
    
    @IBOutlet var tbName : NSTextField
    @IBOutlet var lbHello : NSTextField
    
    @IBAction func tbName_Click(sender: NSButton){
        var name = tbName.stringValue
        lbHello.stringValue = "\(name), hello from Tanako"
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
}