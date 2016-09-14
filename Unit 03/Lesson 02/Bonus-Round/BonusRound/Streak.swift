//
//  Streak.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/13/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

public class Streak {
    var name:String = ""
    var count:UInt64 = 0
    
    init(name: String, count: UInt64) {
        self.name = name
        self.count = 0
    }

    convenience init() {
        self.init(name: "", count: 0)
    }
    
    convenience init(name: String) {
        self.init(name: name, count: 0)
    }
    
    
    internal func incrementCount() -> UInt64 {
        count = count + 1
        return count
    }
    
    internal func decrementCount() -> UInt64 {
        if (count == 0) {
            return count
        }
        
        count = count - 1
        return count
    }
}
