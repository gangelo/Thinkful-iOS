//
//  FibonacciSequence.swift
//  Fibonacci Sequence App
//
//  Created by Gene M. Angelo  Jr. on 9/3/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

//
// The main class that manages the rules governing the Fibonacci sequence generation
class FibonacciSequence {
    
    let includesZero:Bool
    var fibonacciSequence:Array = [UInt64]()
    var _overflowError: Bool = false
    
    init(maxNumber: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        
        printIncludesZero()
        print("maxNumber: \(maxNumber)")
        
        let sequenceArray = getSequenceArrayObject()
        
        while sequenceArray.peekNextSequence() <= maxNumber && !sequenceArray.isNextSequenceOverflow() {
            sequenceArray.pushNextSequence()
        }
        
        self.overflowError = sequenceArray.overflowError
        
        print("Generated Sequence: \(sequenceArray.getSequence())")
        print("Last Generated Sequence: \(sequenceArray.getSequence().last!)")
        print("")
        
        if (self.overflowError) {
            print("*** An overflow error has occurred. The sequence is incomplete. ***")
            print("")
        }
        
        self.fibonacciSequence = sequenceArray.sequence    }
    
    init(numberOfItemsInSequence: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        
        printIncludesZero()
        print("numberOfItemsInSequence: \(numberOfItemsInSequence)")
        
        let sequenceArray = getSequenceArrayObject()
        
        for _ in sequenceArray.count..<numberOfItemsInSequence {
            if (sequenceArray.isNextSequenceOverflow()) {
                self.overflowError = true
                break
            } else {
                sequenceArray.pushNextSequence()
            }
        }
        
        print("Generated Sequence: \(sequenceArray.getSequence())")
        print("Number of Items in Generated Sequence: \(sequenceArray.count)")
        print("")
        
        if (self.overflowError) {
            print("*** An overflow error has occurred. The sequence is incomplete. ***")
            print("")
        }
        
        self.fibonacciSequence = sequenceArray.sequence
    }
    
    var overflowError: Bool {
        get {
            return _overflowError
        }
        
        set(newValue) {
            _overflowError = newValue
        }
    }
    
    func getFibonacciSequence() -> [UInt64] {
        return fibonacciSequence
    }
    
    func getSequenceArrayObject() -> FibonacciSequenceArray {
        return includesZero ? FibonacciSequenceArrayWithZero() : FibonacciSequenceArray()
    }
    
    func printIncludesZero() {
        print("includesZero: \(includesZero)")
    }
}
