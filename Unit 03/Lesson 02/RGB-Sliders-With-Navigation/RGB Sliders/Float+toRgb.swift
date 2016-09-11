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
}