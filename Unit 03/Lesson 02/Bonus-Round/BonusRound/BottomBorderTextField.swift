//
//  BottomBorderTextField.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/11/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Foundation

public class BottomBorderTextField : UITextField, PlaceholderControl {
    private var _borderColor:UIColor = UIColor.blackColor()
    private var _lineWidth:CGFloat = BottomBorderTextField.defaultLineWidth
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.borderStyle = UITextBorderStyle.None
        self.borderColor = UIColor.seventyPercentGreyColor()
    }
    
    public var borderColor: UIColor {
        get { return self._borderColor }
        set { self._borderColor = newValue }
    }
    
    public var lineWidth: CGFloat {
        get { return self._lineWidth }
        set { self._lineWidth = newValue }
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        drawBorder(rect)
    }
}