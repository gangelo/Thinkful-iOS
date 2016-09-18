//: Playground - noun: a place where people can play

import UIKit



func getRandom() -> Int {
    return Int(arc4random_uniform(10) + 1)
}

// Challenge 1
print("Challenge 1...")
func playGame1() {
    let randomNumber = getRandom()
    let userGuess = 7
    var result:String
    
    if(randomNumber == userGuess) {
        result = "You win"
    } else {
        result = "You lose"
    }
    
    print(result)
}

for _ in 0..<100 {
    playGame1()
}

// Challenge 2

print("Challenge 2...")
func playGame2() {
    let randomNumber = getRandom()
    let userGuess = getRandom()
    var result: String
    
    if (randomNumber == userGuess) {
        result = "You win"
    } else {
        result = "You lose"
    }
    
    print(result)
}

for _ in 0..<100 {
    playGame2()
}


// Challenge 3

print("Challenge 3...")

func playGame3() {
    let randomNumber = getRandom()
    let userGuesses = createUserGuessArray()
    var result: String?
    
    for userGuess in userGuesses {
        if (userGuess == randomNumber) {
            result = "You win"
        } else {
            result = "You lose"
        }
    }
    
    print(result)
}

func createUserGuessArray() -> [Int] {
    var resultsArray = [Int]()
    for _ in 1...3 {
        let randomNumber = getRandom()
        resultsArray.append(randomNumber)
    }
    
    return resultsArray
}

for _ in 0..<100 {
    playGame3()
}


// Challenge 4

print("Challenge 4...")
