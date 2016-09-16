//
//  StreakView2.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/13/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

public class StreakView: UIView {
    private var _streak:Streak = Streak()
    
    // MARK: Properties
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var count: UILabel!
    
    init() {
        super.init(frame: CGRectZero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public var streak : Streak {
        get { return _streak }
        set {
            _streak = newValue
            
            self.name.text = _streak.name
            self.count.text = String(_streak.count)
        }
    }
}
