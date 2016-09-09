//
//  NSUserDefaults+setUIColor.swift
//  RGB Sliders
//
//  Created by Gene M. Angelo  Jr. on 9/5/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation
import UIKit

extension NSUserDefaults {
    func setUIColor(color: UIColor?, forKey: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedDataWithRootObject(color)
        }
        setObject(colorData, forKey: forKey)
    }
    
    func uiColorForKey(forKey: String, defaultColor: UIColor) -> UIColor {
        if let colorData = dataForKey(forKey) {
            if let color = (NSKeyedUnarchiver.unarchiveObjectWithData(colorData) as? UIColor) {
                return color
            }
        }
        return defaultColor
    }
}
