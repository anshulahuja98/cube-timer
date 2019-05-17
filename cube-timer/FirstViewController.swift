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
    var time = Time()
    
    func toggle_timer(){
        if(time.timer_status){
            time.stop_timer()
        }
        else{
            time.start_timer()
            time.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FirstViewController.update_timer), userInfo: nil, repeats: true)
        }
        
    }
    @objc
    func update_timer() {
        time.increment_time()
        timer_label.text = time.get_time()
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
        init_web_server()
        let db = TimeDB.sharedInstance
        
        do {
            try db.create_tables()
            
        } catch _ {
            // WIP
        }
        
        print("Finish")
    }
}

