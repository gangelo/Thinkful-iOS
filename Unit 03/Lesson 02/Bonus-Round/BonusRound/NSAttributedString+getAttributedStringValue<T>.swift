//
//  UIControl+getAttributedStringValue.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/12/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

extension NSAttributedString {
    
    // Usage: let color:UIColor? = textField.getAttributedStringValue(textField.attributedPlaceholder, attributeName: NSForegroundColorAttributeName)
    // Note: Return value must be explicitly typed (e.g. let color:UIcolor? = not let color =
    func getAttributedStringValue<T>(attributeName: String) -> T? {
        var attributeValue:T? = nil
        
        func getAttributeBlock(value: AnyObject?, range: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void {
            attributeValue = value as! T?
        }
        
        self.enumerateAttribute(
            attributeName,
            inRange: NSMakeRange(0, self.length),
            options: NSAttributedStringEnumerationOptions(rawValue: UInt(0)),
            usingBlock: getAttributeBlock)
        
        return attributeValue
        
    }
}