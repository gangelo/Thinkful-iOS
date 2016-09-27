//
//  String+capitalizingFirstLetter.swift
//  Web Service Example
//
//  Created by Gene M. Angelo  Jr. on 9/26/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
