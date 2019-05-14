//
//  FirstViewController.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 22/04/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //    Button variables
    var left_button:Bool = false
    var right_button:Bool = false
    
    //    Timer variables
    @IBOutlet weak var timer_label: UILabel!
    var timer_status:Bool = false
    var timer = Timer()
    var counter = 0.00
    
    func toggle_timer(){
        if(timer_status){
            timer.invalidate()
            timer_status = false
            counter = 0.00
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FirstViewController.update_timer), userInfo: nil, repeats: true)
            timer_status = true
        }
        
    }
    func stop_timer(){
        timer_status = false
    }
    func start_timer(){
        timer_status = true
    }
    
    @objc
    func update_timer() {
        counter = counter + 0.01
        timer_label.text = get_time()
    }
    
    func get_time() -> String {
        let milli_seconds:Int = Int((counter - floor(counter))*100)
        let total_seconds:Int = Int(counter)
        let seconds:Int = total_seconds%60
        let minutes:Int = (total_seconds/60)%60
        let hours:Int = total_seconds/360
        if (minutes == 0 ){
            return String(format: "%d:%d", seconds, milli_seconds)
        }
        else if (hours == 0){
            return String(format: "%d:%d:%d", minutes, seconds, milli_seconds)
        }
        else if (hours > 6){
            return "NaN"
        }
        else{
            return String(format: "%d:%d:%d:%d",hours, minutes, seconds, milli_seconds)
        }
        
    }
    
    
    @IBAction func right_button_down(_ sender: Any) {
        right_button = true
    }
    
    @IBAction func left_button_down(_ sender: Any) {
        left_button = true
    }
    
    @IBAction func right_button_up(_ sender: Any) {
        if(right_button && left_button){
            toggle_timer()
        }
        right_button = false
    }
    @IBAction func left_button_up(_ sender: Any) {
        if(right_button && left_button){
            toggle_timer()
        }
        left_button = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer_label.text = get_time()
    }
    
    
}

