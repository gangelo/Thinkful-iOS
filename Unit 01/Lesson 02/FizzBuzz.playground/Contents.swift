//: Playground - noun: a place where people can play

import UIKit

var count = 1
print(count)


// FizzBuzz
let fizz = "Fizz"
let buzz = "Buzz"
let fizzBuzz =  fizz + buzz

print(1)
print(2)
print(fizz)
print(4)
print(buzz)
print(fizz)
print(7)
print(8)
print(fizz)
print(buzz)
print(11)
print(fizz)
print(13)
print(14)
print(fizzBuzz)
// Can also use: print("\(fizz)\(buzz)")

/*
 Rather than typing print() 100 times, you write it once within the loop and the 
 loop does the hard work because unlike humans, computers LOVE repetition). Spend 
 a moment on your own trying to accomplish this without looking ahead.
 */

for counter in 1...100 {
    print(counter)
}

// Modulus
print(10 % 3)
print(11 % 3)

// Some functions to help us with FizzBuzz...
func isDivisibleByThree(x: Int) -> Bool {
    return(x % 3 == 0)
}

func isDivisibleByFive(x: Int) -> Bool {
    return(x % 5 == 0)
}

func isDivisibleByThreeAndFive(x: Int) -> Bool {
    return(isDivisibleByThree(x) && isDivisibleByFive(x))
}

func getFizzBuzz(x: Int) -> String {
    if (isDivisibleByThreeAndFive(x)) {
        return("FizzBuzz")
    } else if (isDivisibleByThree(x)) {
        return("Fizz")
    } else if (isDivisibleByFive(x)) {
        return("Buzz")
    } else {
        return(String(x))
    }
}

// Test the above functions...
getFizzBuzz(1)
getFizzBuzz(9)
getFizzBuzz(10)
getFizzBuzz(15)

for i in 1...100 {
    getFizzBuzz(i)
}




