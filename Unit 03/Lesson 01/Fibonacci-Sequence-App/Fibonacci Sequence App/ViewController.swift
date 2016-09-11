//
//  ViewController.swift
//  Fibonacci Sequence App
//
//  Created by Gene M. Angelo  Jr. on 9/3/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewScroller: UIScrollView!
    @IBOutlet weak var includesZero: UISwitch!
    @IBOutlet weak var includesZeroLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var numbersInSequenceSlider: UISlider!
    
    var fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: 2, includesZero: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.includesZeroValueChanged()
        self.numbersInSequenceValueChanged()
        self.updateFibonacciSequence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func updateFibonacciSequence() {
        numbersInSequenceSlider.maximumValue = includesZero.on ? 94 : 93
        
        includesZeroValueChanged()
        numbersInSequenceValueChanged()
        
        fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: UInt64(numbersInSequenceSlider.value), includesZero: includesZero.on)
        
        textView.text = fibonacciSequence.getFibonacciSequence().description
        if fibonacciSequence.overflowError {
            textView.text = textView.text + "\n\nAn overflow error occurred, only \(fibonacciSequence.getFibonacciSequence().count) results returned"
        }
    }
    
    func includesZeroValueChanged() {
        includesZeroLabel.text = includesZero.on ? "Yes" : "No"
    }
    
    func numbersInSequenceValueChanged() {
        numberOfItemsLabel.text = String(UInt(numbersInSequenceSlider.value))
    }
}