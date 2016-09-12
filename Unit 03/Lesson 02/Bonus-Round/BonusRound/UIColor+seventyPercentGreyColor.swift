//
//  UIColor+70PercentGreyColor.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/12/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    class func seventyPercentGreyColor() -> UIColor {
        let seventyPercent:CGFloat = 0.098
        let color = UIColor(red: 0.0, green: 0.0, blue: seventyPercent, alpha: 0.22)
        return color
    }
}
