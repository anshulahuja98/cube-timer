//
//  TimeDB.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 14/05/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import Foundation
import SQLite

class TimeDB{
    static let sharedInstance:TimeDB = TimeDB()
    let db: Connection?
    
    // Singleton
    private init(){
        do {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
            db = try Connection("\(path)/db.sqlite3")
        }
        catch  {
            db = nil
            print("Connection to Database failed: \(error)")
        }
        
    }
    
    func create_tables(){
        do{
            try TimeDataHelper.create_time_table()
        }
        catch _ {
            // WIP
        }
    }
}
