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
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: .AlignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: .AlignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Vertical
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        /*for _ in 1 ..< 100 {
            let vw = UIButton(type: UIButtonType.System)
            vw.setTitle("Button", forState: .Normal)
            stackView.addArrangedSubview(vw)
        }*/
        
        let service = StreakService()
        
        var x = 0
        let controlHeight =  42
        for streak in service.all()! {
            stackView.addArrangedSubview(StreakView(frame: CGRect(x: 0, y: 0, width: 200, height: controlHeight), streak: streak))
            x = x + controlHeight
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let navigationController = segue.destinationViewController as! UINavigationController
            if let streakViewController = navigationController.topViewController as? StreakViewController {
                switch(identifier) {
                case Constants.Segues.addStreak:
                    streakViewController.streak = Streak()
                    streakViewController.isAddMode = true
                case Constants.Segues.editStreak:
                    streakViewController.streak = Streak(name: "Vitamins", count: 10)
                    streakViewController.isEditMode = true
                default:
                    break
                }
            }
        }
    }


}

