//: Playground - noun: a place where people can play

import UIKit

let growthPercent = 0.007
var population = 100000.00


func printPopulationGrowth(population: Double, year: Int)
{
    print("The population for year \(year) is \(population)")
}

func calcPopulationGrowth(population: Double) -> Double
{
    return (population * growthPercent)
}

func run(){
    printPopulationGrowth(population, year: 0)
    
    for year in 1...100 {
        population += calcPopulationGrowth(population)
        printPopulationGrowth(population, year: year)
        population
    }
}

run()