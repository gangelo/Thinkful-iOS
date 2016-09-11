//: Playground - noun: a place where people can play

import UIKit
import Foundation

var numbers = [1, 2, 3, 4]
var letters = ["a", "b", "c", "d"]



for i in numbers {
    print(i)
}

numbers[0]
numbers[1]
numbers[2]
numbers[3]

letters[2]
letters[1]
letters[0]

var groceryList = ["eggs", "milk", "cat food"]

groceryList.append("arugula")
groceryList.append("cheese")
groceryList.append("crackers")

groceryList += ["caviar", "salami", "pie"]

print(groceryList)

groceryList.removeAtIndex(4)
groceryList.removeAtIndex(groceryList.count - 1)
groceryList.removeLast()
groceryList.last!
groceryList.last

// Initialize an empty array of Strings
var emptyArray = [String]()

if (!emptyArray.isEmpty) {
    emptyArray.removeAtIndex(emptyArray.count - 1)
}


/*
 This results in an error because nothing is there. 
 Try removing the ! and see what happens. The value 
 printed is nil, which means basically a non-value, or 
 lack of value. Later units will revisit this concept.
 */
// groceryList = [String]()
// print(groceryList.last!)



groceryList.insert("steak", atIndex: 1)

// Challenge

// How would you create an array that includes 1-100?
var newArray = [Int](1...100)

// How can you use a loop to go through the first array and 
// put every even number into a second array?
// Note: filter only available if "import Foundation"
let bigNumberArray = [Int](1...100)
var halfArray = [Int](bigNumberArray.filter { $0 % 2 == 0 })

// Can you print both out to the console?
print(bigNumberArray)
print(halfArray)







