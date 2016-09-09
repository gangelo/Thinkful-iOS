//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let rect = CGRect(x: 0, y: 0, width: 320, height: 320)
let view = UIView(frame: rect)

view.backgroundColor = UIColor.yellowColor()

XCPlaygroundPage.currentPage.liveView = view

//
let subviewRect = CGRect(x: 10, y: 10, width: 100, height: 100)
let subview = UIView(frame: subviewRect)

subview.backgroundColor = UIColor.redColor()

// Add the subview...
view.addSubview(subview)
