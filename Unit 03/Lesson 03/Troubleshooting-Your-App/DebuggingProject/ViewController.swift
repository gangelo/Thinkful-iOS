//
//  ViewController.swift
//  DebuggingProject
//
//  Created by Thinkful on 11/21/14.
//  Copyright (c) 2014 Thinkful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...30 {
            playGame()
        }
    }
    
    func getRandomNumber() -> Int {
        let randomNumber = Int(arc4random_uniform(10)) + 1
        return randomNumber
    }
    
    func createUserGuessArray() -> [Int] {
        var resultsArray = [Int]()
        for _ in 1...3 {
            let randomNumber = getRandomNumber()
            resultsArray.append(randomNumber)
        }
        
        return resultsArray
    }
    
    func playGame() {
        var result:String
        
        let randomNumber = getRandomNumber()
        result = "Random number: \(randomNumber)"
        
        let userGuesses = createUserGuessArray()
        result = result + ", User guesses: \(userGuesses): "
        
        result = result + (userGuesses.contains(randomNumber) ? "You win" : "You lose")
        
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

