//
//  UIColor+getRGB.swift
//  RGB Sliders
//
//  Created by Gene M. Angelo  Jr. on 9/5/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {    
    class func toRGB(color: UIColor?, defaultColor: UIColor) -> (red: Float, green: Float, blue: Float, alpha: Float) {
        if let color = color {
            return color.toRGB()
        }
        return defaultColor.toRGB()
    }
    
    func toRGB() -> (red: Float, green: Float, blue: Float, alpha: Float) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (red: Float(r), green: Float(g), blue: Float(b), alpha: (Float(a)))
    }
}