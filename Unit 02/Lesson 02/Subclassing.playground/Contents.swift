//: Playground - noun: a place where people can play

import UIKit

class Shape {
    var color:UIColor
    
    init(color:UIColor) {
        self.color = color
    }
    
    func getArea() -> Double {
        return 0;
    }
}

class Circle : Shape {
    var radius:Int
    
    init(radius:Int, color:UIColor) {
        self.radius = radius
        
        super.init(color: color)
    }
    
    override func getArea() -> Double {
        let power = Double(pow(Double(radius), Double(2)))
        return (Double(M_PI * power))
    }
}

class Square : Shape {
    var width:Int
    
    init(width:Int, color:UIColor) {
        self.width = width
        
        super.init(color: color)
    }
    
    override func getArea() -> Double {
        return (Double(width * width))
    }
}

class Rectangle : Square {
    var length:Int
    
    init(width:Int, length:Int, color:UIColor) {
        self.length = length
        super.init(width: width, color: color)
    }
    
    override func getArea() -> Double {
        return (Double(length * width))
    }
}


var circle = Circle(radius: 6, color: UIColor.redColor())
circle.color
circle.radius
circle.getArea()

var square = Square(width: 100, color: UIColor.redColor())
square.color
square.width
square.getArea()

var rectangle = Rectangle(width: 100, length: 75, color: UIColor.redColor())
rectangle.color
rectangle.width
rectangle.length
rectangle.getArea()



class Dimensions {
    var width:Int
    var height:Int
    var depth:Int
    
    init(width:Int, height:Int, depth:Int) {
        self.width = width
        self.height = height
        self.depth = depth
    }
    
    func getArea() -> Double {
        return Double(width * height * depth)
    }
}

class Vehicle {
    var make:String
    var model:String
    var wheels:Int
    
    init(make:String, model:String, wheels:Int) {
        self.make = make
        self.model = model
        self.wheels = wheels
    }
    
    func getStorageArea() -> Double {
        return 0
    }
}


class Car : Vehicle {
    var trunkArea:Dimensions
    
    init(make:String, model:String, wheels:Int, trunkArea:Dimensions) {
        self.trunkArea = trunkArea
        
        super.init(make: make, model: model, wheels: wheels)
    }
    
    override func getStorageArea() -> Double {
        return trunkArea.getArea()
    }
}

class Truck : Vehicle {
    var cabArea:Dimensions
    
    init(make:String, model:String, wheels:Int, cabArea:Dimensions) {
        self.cabArea = cabArea
        
        super.init(make: make, model: model, wheels: wheels)
    }
    
    override func getStorageArea() -> Double {
        return cabArea.getArea()
    }
}

var car = Car(make: "Honda", model: "Civic", wheels: 4, trunkArea: Dimensions(width: 3, height: 4, depth: 2))
car.make
car.model
car.wheels
car.trunkArea
car.getStorageArea()

var truck = Truck(make: "Mack", model: "Titan", wheels: 10, cabArea: Dimensions(width: 7, height: 8, depth: 8))
truck.make
truck.model
truck.wheels
truck.cabArea
truck.getStorageArea()


// Structures
//
// Structures are great for storing simple bits of data, when inheritance is not 
// required and when you don't need custom initializers.
//

let rect = CGRect(x: 0, y: 0, width: 320, height: 320)

// is the same as...

let point = CGPoint(x: 0, y: 0)
let size = CGSize(width: 320, height: 320)
let rect2 = CGRect(origin: point, size: size)







