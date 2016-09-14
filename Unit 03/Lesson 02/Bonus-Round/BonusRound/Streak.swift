//
//  Streak.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/13/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

public class Streak {
    private var _name:String = ""
    private var _count:UInt64 = 0
    
    init(name: String, count: UInt64) {
        self._name = name
        self._count = 0
    }

    convenience init() {
        self.init(name: "", count: 0)
    }
    
    convenience init(name: String) {
        self.init(name: name, count: 0)
    }
    
    var name: String {
        get { return _name }
        set { _name = newValue }
    }
    
    var count: UInt64 {
        get { return _count }
        set { _count = newValue }
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
