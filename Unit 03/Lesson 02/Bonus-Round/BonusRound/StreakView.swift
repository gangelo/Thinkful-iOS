//
//  StreakView2.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/13/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class StreakView: UIView {
    private var streak:Streak = Streak()
    
    /*
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    convenience init?(coder aDecoder: NSCoder, streak: Streak) {
        self.init(coder: aDecoder)
        addSubviews()
    }
    */
    
    //required convenience init?(coder: NSCoder, streak: Streak) {
    //    self.init(coder: coder)
    //}
    
    init(frame: CGRect, streak: Streak) {
        self.streak = streak
        super.init(frame: frame)
        addSubviews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        nameLabel.text = self.streak.name
        self.addSubview(nameLabel)
    }
}
