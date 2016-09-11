// Thinkful Playground
// Thinkful.com

// Fibonacci Sequence

// By definition, the first two numbers in the Fibonacci sequence are 1 and 1, or 0 and 1, depending on the chosen starting point of the sequence, and each subsequent number is the sum of the previous two.

import UIKit

//
// Fibonacci sequence array that that handles [1, 1] sequences.
class FibonacciSequenceArray {
    var _overflowError: Bool
    var sequence:Array = [UInt]()
    
    init() {
        _overflowError = false
        sequence = [UInt]([1, 1])
    }
    
    var overflowError: Bool {
        get {
            return _overflowError
        }
        
        set(newValue) {
            _overflowError = newValue
        }
    }
    
    var count: UInt {
        get {
            return UInt(sequence.count)
        }
    }
    
    var nextToLast: UInt {
        return sequence[sequence.count - 2]
    }
    
    subscript(index: Int) -> UInt {
        get {
            return sequence[index]
        }
        set {
            sequence.append(newValue)
        }
    }
    
    func pushNextSequence() -> UInt {
        if (overflowError || isNextSequenceOverflow()) {
            // Just return 0 if we can't handle the numbers
            if (!overflowError) { overflowError = true }
            return 0
        } else {
            sequence.append(getNextSequence())
            return sequence.last!
        }
    }
    
    func peekNextSequence() -> UInt {
        return getNextSequence()
    }
    
    func getNextSequence() -> UInt {
        let overflow = isNextSequenceOverflow()
        // Just return 0 if we can't handle the numbers
        return overflow ? 0 : UInt(sequence.last! + nextToLast)
    }
    
    func isNextSequenceOverflow() -> Bool {
        let (_, overflow) = UInt.addWithOverflow(sequence.last!, nextToLast)
        return overflow
    }
    
    func getSequence() -> [UInt] {
        return sequence
    }
}

//
// Fibonacci sequence array that that handles [0, 1] sequences.
class FibonacciSequenceArrayWithZero : FibonacciSequenceArray {
    
    override init() {
        super.init()
        sequence = [UInt]([0, 1])
    }
}

//
// The main class that manages the rules governing the Fibonacci sequence generation
class FibonacciSequence {
    
    let includesZero:Bool
    
    init(maxNumber: UInt, includesZero: Bool) {
        self.includesZero = includesZero
        
        // TODO: Create an array which contains the numbers in the Fibonacci sequence, but don't add any numbers to the array which exceed the maxNumber. For example, if the maxNumber is 10 then the array should contain [0,1,1,2,3,5,8] because the next number is 13 which is higher than the maxNumber. If includesZero is false then you should not include the number 0 in the sequence.
        
        printIncludesZero()
        print("maxNumber: \(maxNumber)")
        
        let sequenceArray = getSequenceArray()
        
        while sequenceArray.peekNextSequence() <= maxNumber && !sequenceArray.isNextSequenceOverflow() {
            sequenceArray.pushNextSequence()
        }
        
        print("Generated Sequence: \(sequenceArray.getSequence())")
        print("Last Generated Sequence: \(sequenceArray.getSequence().last!)")
        print("")
        if (sequenceArray.overflowError) {
            print("*** An overflow error has occurred. The sequence is incomplete. ***")
            print("")
        }
    }
    
    init(numberOfItemsInSequence: UInt, includesZero: Bool) {
        self.includesZero = includesZero
        
        // TODO: Create an array which contains the numbers in the Fibonacci sequence, and the array should contain this many items: numberOfItemsInSequence. For example, if numberOfItemsInSequence is 10 then the array should contain [0,1,1,2,3,5,8,13,21,34] if inlcudesZero is true, or [1,1,2,3,5,8,13,21,34,55] if includesZero is false.
        
        printIncludesZero()
        print("numberOfItemsInSequence: \(numberOfItemsInSequence)")
        
        let sequenceArray = getSequenceArray()
        
        for _ in sequenceArray.count..<numberOfItemsInSequence {
            if (sequenceArray.isNextSequenceOverflow()) {
                break
            } else {
                sequenceArray.pushNextSequence()
            }
        }
        
        
        print("Generated Sequence: \(sequenceArray.getSequence())")
        print("Number of Items in Generated Sequence: \(sequenceArray.count)")
        print("")
        if (sequenceArray.overflowError) {
            print("*** An overflow error has occurred. The sequence is incomplete. ***")
            print("")
        }
    }
    
    func getSequenceArray() -> FibonacciSequenceArray {
        return includesZero ? FibonacciSequenceArrayWithZero() : FibonacciSequenceArray()
    }
    
    func printIncludesZero() {
        print("includesZero: \(includesZero)")
    }
}

let fibanocciSequence = FibonacciSequence(maxNumber:12345, includesZero: false)

let anotherSequence = FibonacciSequence(numberOfItemsInSequence: 95, includesZero: true)
