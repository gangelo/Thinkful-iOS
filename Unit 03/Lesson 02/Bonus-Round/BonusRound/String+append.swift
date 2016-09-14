//
//  String+append.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/13/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

extension String {
    
    mutating func append(string: String) -> String {
        return append(string, withSpace: true)
    }
    
    mutating func append(string: String, withSpace: Bool) -> String {
        self = withSpace ? "\(self) \(string)" : self + string
        return self
    }
}