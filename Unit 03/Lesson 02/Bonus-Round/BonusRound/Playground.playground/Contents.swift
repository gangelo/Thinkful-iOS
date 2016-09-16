//: Playground - noun: a place where people can play

import Cocoa


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


private var repository = [
    "Streak0" : Streak(name: "Streak0", count: 0),
    "Streak1" : Streak(name: "Streak1", count: 0),
    "Streak2" : Streak(name: "Streak2", count: 0),
    "Streak3" : Streak(name: "Streak3", count: 0),
    "Streak4" : Streak(name: "Streak4", count: 0),
    "Streak5" : Streak(name: "Streak5", count: 0),
    "Streak6" : Streak(name: "Streak6", count: 0),
    "Streak7" : Streak(name: "Streak7", count: 0),
    "Streak8" : Streak(name: "Streak8", count: 0),
    "Streak9" : Streak(name: "Streak9", count: 0),
    "Streak10" : Streak(name: "Streak10", count: 0),
    "Streak11" : Streak(name: "Streak11", count: 0),
    "Streak12" : Streak(name: "Streak12", count: 0),
    "Streak13" : Streak(name: "Streak13", count: 0),
    "Streak14" : Streak(name: "Streak14", count: 0),
    "Streak15" : Streak(name: "Streak15", count: 0)]






