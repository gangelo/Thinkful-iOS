//
//  ViewController.swift
//  Unit03Lesson02_06_BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/6/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let destinationViewController = segue.destinationViewController
            
            switch(identifier) {
                case Constants.Segues.addStreak:
                    if let streakViewController = destinationViewController as? StreakViewController {
                        streakViewController.streak = Streak()
                        streakViewController.isAddMode = true
                    }
                case Constants.Segues.editStreak:
                    if let streakViewController = destinationViewController as? StreakViewController {
                        streakViewController.streak = Streak(name: "Vitamins", count: 10)
                        streakViewController.isEditMode = true
                    }
                default:
                    break
            }
        }
    }


}

