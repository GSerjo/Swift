//
//  Alarm.swift
//  LocalNotifications
//
//  Created by Serjo on 15/07/15.
//  Copyright (c) 2015 Serjo. All rights reserved.
//

import Foundation
import AVFoundation

class Alarm {
    
    private var audioPlayer: AVAudioPlayer!
    private let filePath: String
    
    init(filePath: String){
        self.filePath = filePath
    }
    
    func play() {
        
        var alertSound = NSURL(fileURLWithPath: filePath)
        println(alertSound)

        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: nil)
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func stop() {
        
        if(audioPlayer == nil){
            return
        }
        
        audioPlayer.stop()
        audioPlayer = nil
    }
}