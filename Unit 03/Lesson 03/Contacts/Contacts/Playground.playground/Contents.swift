//: Playground - noun: a place where people can play

import UIKit


var counter = 0

for _ in 0..<100 {
    let number = Int(arc4random_uniform(1000) + 1001)
    if (number < 1000) {
        print("*** no good ***")
        counter = counter + 1
    }
    
    if (number > 9999) {
        print("*** no good ***")
        counter = counter + 1

    }
    
    print(number)
    
}

print("Total invalid numbers: \(counter))")