//
//  String+isNilOrEmpty.swift
//  MWExtensions
//
//  Created by Gene M. Angelo  Jr. on 9/20/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

public extension Optional where Wrapped: ExpressibleByStringLiteral {
    func isNilOrEmpty() -> Bool {
        if let string = self as! String? {
            return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        } else {
            return true
        }
    }    
}
