//
//  FirstViewController.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 22/04/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var trigger_checker: UILabel!
    var left_button:Bool = false
    var right_button:Bool = false
    var timer_status = false
    
    func toggle_timer(){
        if(timer_status){
            stop_timer()
        }
        else{
            start_timer()
        }
        
    }
    func stop_timer(){
        timer_status = false
    }
    func start_timer(){
        timer_status = true
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
        // Do any additional setup after loading the view, typically from a nib.
    }


}

