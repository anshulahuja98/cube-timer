//
//  Time.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 14/05/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import Foundation
import SQLite

class TimeDataHelper{
    static let TABLE_NAME = "time_record"
    
    static let table = Table(TABLE_NAME)
    static let id = Expression<Int64>("id")
    static let counter = Expression<Double>("counter")
    
    static   func create_time_table() {
        let db = TimeDB.sharedInstance.db
        do {
            let _ = try db!.run( table.create(ifNotExists: true) {t in
                t.column(id, primaryKey: .autoincrement)
                t.column(counter)
            })
            
        } catch _ {
            // Error throw if table already exists
        }
    }
    static func insert_time(time:Time){
        let db = TimeDB.sharedInstance.db
        do {
            try db!.run(table.insert(counter <- time.counter))
        } catch _ {
            // Error throw if table already exists
        }
    }
    static func get_time() -> Time{
        let db = TimeDB.sharedInstance.db
        do {
            let all = Array(try db!.prepare(table))
            print(all)
            
        } catch _ {
            // Error throw if table already exists
        }
        return Time(counter: 0.00)
    }
}

class Time{
    var timer_status:Bool
    var timer:Timer!
    var counter:Double
    init(counter:Double = 0.00) {
        timer_status=false
        timer = Timer()
        self.counter = counter
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
