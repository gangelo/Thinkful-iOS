// Thinkful Playground
// Thinkful.com

// Fibonacci Sequence

// By definition, the first two numbers in the Fibonacci sequence are 1 and 1, or 0 and 1, depending on the chosen starting point of the sequence, and each subsequent number is the sum of the previous two.

import UIKit

class FibonacciSequence {
    
    let includesZero:Bool
    var values:[Int] = []
    
    init(maxNumber: Int, includesZero: Bool) {
        self.includesZero = includesZero
        
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, but don't add any numbers to the array which exceed the maxNumber. For example, if the maxNumber is 10 then the array should contain [0,1,1,2,3,5,8] because the next number is 13 which is higher than the maxNumber. If includesZero is false then you should not include the number 0 in the sequence.
        
        initializeValuesArray()
        
        while true {
            let sequence = values[values.count - 1] + values[values.count - 2]
            if (sequence > maxNumber) { break }
            values.append(sequence)
            print(values)
        }
        
        print("Max sequence: \(values.last!)")
    }
    
    init(numberOfItemsInSequence: Int, includesZero: Bool) {
        self.includesZero = includesZero
        
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, and the array should contain this many items: numberOfItemsInSequence. For example, if numberOfItemsInSequence is 10 then the array should contain [0,1,1,2,3,5,8,13,21,34] if inlcudesZero is true, or [1,1,2,3,5,8,13,21,34,55] if includesZero is false.    
        
        initializeValuesArray()
        
        for _ in values.count..<numberOfItemsInSequence {
            let sequence = values[values.count - 1] + values[values.count - 2]
            values.append(sequence)
            print(values)
        }
        
        print("Total sequences: \(values.count)")
    }
    
    func initializeValuesArray() {
        includesZero ? values.append(0) : values.append(1)
        values.append(1)
    }
}

let fibanocciSequence = FibonacciSequence(maxNumber:12345, includesZero: true)

let anotherSequence = FibonacciSequence(numberOfItemsInSequence: 25, includesZero: false)
