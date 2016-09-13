//
//  BottomBorderControl.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/12/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public protocol PlaceholderControl {
    // MARK: Properties
    var borderColor:UIColor { get set }
    var lineWidth:CGFloat { get set }
}

extension PlaceholderControl {
    static var defaultLineWidth:CGFloat { return 2.0 }
    
    // Call this method from your overriden drawRect(rect: CGRect)
    // method in the implementing class.
    func drawBorder(rect: CGRect) {
        let startingPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let path = UIBezierPath()
        
        path.moveToPoint(startingPoint)
        path.addLineToPoint(endingPoint)
        path.lineWidth = self.lineWidth
        
        let color:UIColor = self.borderColor
        color.setStroke()
        
        path.stroke()
    }
}
