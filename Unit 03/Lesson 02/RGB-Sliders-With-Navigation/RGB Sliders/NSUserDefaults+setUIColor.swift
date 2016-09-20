//
//  NSUserDefaults+setUIColor.swift
//  RGB Sliders
//
//  Created by Gene M. Angelo  Jr. on 9/5/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    func setUIColor(_ color: UIColor?, forKey: String) {
        var colorData: Data?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color)
        }
        set(colorData, forKey: forKey)
    }
    
    func uiColorForKey(_ forKey: String, defaultColor: UIColor) -> UIColor {
        if let colorData = data(forKey: forKey) {
            if let color = (NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor) {
                return color
            }
        }
        return defaultColor
    }
}
