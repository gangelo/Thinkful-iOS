//: Playground - noun: a place where people can play

import UIKit



func whereAreTheyNowIf(name: String) {
    var college = ""
    let lowerName = name.lowercaseString
    
    if (lowerName == "thomas" || lowerName == "laura" || lowerName == "grae") {
        college = "Casper College"
    } else if (lowerName == "liz" || lowerName == "bhaumik" || lowerName == "sam" || lowerName == "tatiana" || lowerName == "nora" || lowerName == "saul") {
            college = "WyoTech"
    } else if (lowerName == "ben") {
        college = "Harvard"
    } else {
        college = "Unknown"
    }
    
    printIt(name, college: college)
}


func whereAreTheyNowSwitch(name: String) {
    var college = ""
    let lowerName = name.lowercaseString
    
    switch lowerName {
        case "liz", "bhaumik", "sam", "tatiana", "nora", "saul":
            college = "WyoTech"
        case "thomas", "laura", "grae":
            college = "Casper College"
        case "ben":
            college = "Harvard"
        default:
            college = "Unknown"
    }
    
    printIt(name, college: college)
}

func printIt(name: String, college: String) {
    print("\(name) is currently at \(college)")
}

var people = ["Thomas", "Liz", "Ben", "Bhaumik", "Sam", "Tatiana", "Laura", "Nora", "Saul", "Grae", "Howdy Dudy"]

// "if" statements...
print("*** Using 'if' statements ***")
for name in people {
    whereAreTheyNowIf(name)
}

// "switch" statements...
print("*** Using 'switch' statements ***")
for name in people {
    whereAreTheyNowSwitch(name)
}



// Challenge

/*
 Create a switch statement that will evaluate single letters (i.e. 'a', 'b', 'c') as follows:
 
 If the letter is a vowel, then it should print "It's a vowel."
 If the letter is a consonant, then it should print "It's a consonant."
 If it's some other character then it will say, "I don't know what this is!"
*/


func letters(letter: String) {
    let letterLower = letter.lowercaseString

    switch letterLower {
        case "a", "e", "i", "o", "u", "y":
            print("\(letterLower) is a vowel.")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z":
            print("\(letterLower) is a consonate.")
        default:
            print("\(letterLower) - I don't know what this is.")
    }
}

var characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "2"]

for char in characters {
    letters(char)
}



