//
//  FibonacciSequenceArray.swift
//  Fibonacci Sequence App
//
//  Created by Gene M. Angelo  Jr. on 9/3/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

//
// Fibonacci sequence array that that handles [1, 1] sequences.
class FibonacciSequenceArray {
    var _overflowError: Bool
    var sequence:[UInt64] = [UInt64]()
    
    init() {
        _overflowError = false
        sequence = [UInt64]([1, 1])
    }
    
    var overflowError: Bool {
        get {
            return _overflowError
        }
        
        set(newValue) {
            _overflowError = newValue
        }
    }
    
    var count: UInt64 {
        get {
            return UInt64(sequence.count)
        }
    }
    
    var nextToLast: UInt64 {
        return sequence[sequence.count - 2]
    }
    
    subscript(index: Int) -> UInt64 {
        get {
            return sequence[index]
        }
        set {
            sequence.append(newValue)
        }
    }
    
    func pushNextSequence() -> UInt64 {
        if (overflowError || isNextSequenceOverflow()) {
            // Just return 0 if we can't handle the numbers
            if (!overflowError) { overflowError = true }
            return 0
        } else {
            sequence.append(getNextSequence())
            return sequence.last!
        }
    }
    
    func peekNextSequence() -> UInt64 {
        return getNextSequence()
    }
    
    func getNextSequence() -> UInt64 {
        overflowError = isNextSequenceOverflow()
        // Just return 0 if we can't handle the numbers
        return overflowError ? 0 : UInt64(sequence.last! + nextToLast)
    }
    
    func isNextSequenceOverflow() -> Bool {
        let (_, overflow) = UInt64.addWithOverflow(sequence.last!, nextToLast)
        return overflow
    }
    
    func getSequence() -> [UInt64] {
        return sequence
    }
}
