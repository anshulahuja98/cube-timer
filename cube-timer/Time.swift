//
//  Time.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 14/05/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import Foundation

class Time{
    var timer_status:Bool
    var timer:Timer!
    var counter:Float
    init() {
        timer_status=false
        timer = Timer()
        counter = 0.00
    }
    
    func stop_timer(){
        timer.invalidate()
        timer_status = false
        counter = 0.00
    }
    func start_timer(){
        timer_status = true
    }
    
    func get_time() -> String {
        let milli_seconds:Int = Int((counter - floor(counter))*100)
        let total_seconds:Int = Int(counter)
        let seconds:Int = total_seconds%60
        let minutes:Int = (total_seconds/60)%60
        let hours:Int = total_seconds/360
        if (hours == 0 ){
            return String(format: "%02d:%02d:%02d",minutes, seconds, milli_seconds)
        }
        else if (hours > 6){
            return "NaN"
        }
        else{
            return String(format: "%d:%02d:%02d:%02d",hours, minutes, seconds, milli_seconds)
        }
        
    }
    func increment_time(){
        counter = counter + 0.01
    }
    
}
