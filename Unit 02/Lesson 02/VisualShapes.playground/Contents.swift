//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

//
// Shape base class

class Shape : UIView {
    var color:UIColor
    
    init(color:UIColor) {
        self.color = color
        super.init(frame: CGRectZero)
        self.backgroundColor = color
        setFrameSize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFrameSize() {
        self.frame.size = CGSizeZero
    }
    
    func getArea() -> Double {
        return 0;
    }
}

//
// Circle

class Circle : Shape {
    var radius:Int
    
    init(radius:Int, color:UIColor) {
        self.radius = radius
        super.init(color: color)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setFrameSize() {
        self.frame.size = CGSize(width: radius * 2, height: radius * 2)
    }
    
    override func getArea() -> Double {
        let power = Double(pow(Double(radius), Double(2)))
        return (Double(M_PI * power))
    }
}

//
// Square

class Square : Shape {
    var width:Int
    
    init(width:Int, color:UIColor) {
        self.width = width
        super.init(color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setFrameSize() {
        self.frame.size = CGSize(width: width, height: width)
    }
    
    override func getArea() -> Double {
        return (Double(width * width))
    }
}

//
// Create the live view and show the shapes...

var circle = Circle(radius: 50, color: UIColor.blueColor())
circle.center = CGPoint(x: 100, y: 100)

var square = Square(width: 100, color: UIColor.redColor())
square.center = CGPoint(x: 150, y: 250)

let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
XCPlaygroundPage.currentPage.liveView = view

view.addSubview(circle)
view.addSubview(square)


//
// Comprehension Check...

class Rectangle : Square {
    var length:Int
    
    init(width:Int, length:Int, color:UIColor) {
        self.length = length
        super.init(width: width, color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setFrameSize() {
        self.frame.size = CGSize(width: width, height: length)
    }
    
    override func getArea() -> Double {
        return (Double(length * width))
    }
}

class RoundedRectangle : Rectangle {
    var cornerRadius:Int
    
    init(width:Int, length:Int, cornerRadius:Int, color:UIColor) {
        self.cornerRadius = cornerRadius
        super.init(width: width, length:length, color: color)
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setFrameSize() {
        self.frame.size = CGSize(width: width, height: length)
    }
    
    override func getArea() -> Double {
        return (Double(length * width))
    }
}

var rectangle = RoundedRectangle(width: 100, length: 150, cornerRadius: 25, color: UIColor.yellowColor())
rectangle.center = CGPoint(x: 250, y: 100)

view.addSubview(rectangle)


