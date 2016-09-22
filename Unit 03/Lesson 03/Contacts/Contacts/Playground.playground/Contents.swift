//: Playground - noun: a place where people can play

import UIKit




var tuple = (1, 2)


func testIt(titles: (title1: String, title2: String)) {
    print(titles.title1)
    print(titles.title2)
    
    titles.0
}

testIt(titles: (title1: "Edit", title2: "Done"))




extension Bool {
    
    func toInt() -> Int {
        return self ? 1 : 0
    }
}

extension Bool {
    
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
}




var bool = false

bool.toInt()

bool.toggle()

bool.toggle()