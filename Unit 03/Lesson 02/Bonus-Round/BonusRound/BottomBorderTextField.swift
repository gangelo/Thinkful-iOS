//
//  BottomBorderTextField.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/11/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public class BottomBorderTextField : UITextField {
    private var placeHolderTextColor:UIColor?
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.borderStyle = UITextBorderStyle.None
        
        var color:UIColor = UIColor.blackColor()
        
        func getAttributeBlock(value: AnyObject?, range: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void {
            self.placeHolderTextColor = ((value ?? self.tintColor) as! UIColor)
        }
        
        if self.attributedPlaceholder != nil {
            self.attributedPlaceholder!.enumerateAttribute(
                NSForegroundColorAttributeName,
                inRange: NSMakeRange(0, self.attributedPlaceholder!.length),
                options: NSAttributedStringEnumerationOptions(rawValue: 0),
                usingBlock: getAttributeBlock)
        }
    }
    
    override public func drawRect(rect: CGRect) {
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        let path = UIBezierPath()
        
        path.moveToPoint(startingPoint)
        path.addLineToPoint(endingPoint)
        path.lineWidth = 2.0
        
        let color = (self.placeHolderTextColor ?? self.tintColor) as UIColor
        color.setStroke()
        
        path.stroke()
    }
}