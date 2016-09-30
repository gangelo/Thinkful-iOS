//
//  UIViewCollection+removeAllSubviews.swift
//  Photo-Search-Example
//
//  Created by Gene M. Angelo  Jr. on 9/29/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

extension Collection where Iterator.Element == UIView {
   
   // Removes all subviews from the UIView
   func removeAllSubviews() {
      for subview in self {
         subview.removeFromSuperview()
      }
   }
}
