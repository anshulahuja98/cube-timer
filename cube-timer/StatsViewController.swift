//
//  SecondViewController.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 22/04/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = TimeDB.sharedInstance
        
        do {
            try db.create_tables()
            
        } catch _ {
            // WIP
        }
    }


}

