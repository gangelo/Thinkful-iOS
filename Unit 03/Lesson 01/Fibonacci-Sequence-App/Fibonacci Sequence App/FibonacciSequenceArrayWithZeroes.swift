//
//  FibonacciSequenceArrayWithZeroes.swift
//  Fibonacci Sequence App
//
//  Created by Gene M. Angelo  Jr. on 9/3/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

//
// Fibonacci sequence array that that handles [0, 1] sequences.
class FibonacciSequenceArrayWithZero : FibonacciSequenceArray {
    
    override init() {
        super.init()
        sequence = [UInt64]([0, 1])
    }
}