//
//  UInt+ToRgb.swift
//  RGB Sliders
//
//  Created by Gene M. Angelo  Jr. on 9/4/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation
import UIKit

extension Float {
    var toRgbValue: CGFloat { return CGFloat(self) / 255.0 }
    
    var toUIColorRed: UIColor { return UIColor(red: self.toRgbValue, green: 0, blue: 0, alpha: 1) }
    var toUIColorGreen: UIColor { return UIColor(red: 0, green: self.toRgbValue, blue: 0, alpha: 1) }
    var toUIColorBlue: UIColor { return UIColor(red: 0, green: 0, blue: self.toRgbValue, alpha: 1) }
}