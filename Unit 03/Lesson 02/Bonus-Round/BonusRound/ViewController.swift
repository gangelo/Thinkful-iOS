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
        stackView.distribution = .EqualSpacing
        stackView.alignment = .Center
        //stackView.spacing = 10
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        
        let service = StreakService()
        for streak in service.all()! {
            if let streakView = NSBundle.mainBundle().loadNibNamed("StreakView", owner: stackView, options: nil).first as? StreakView {
                streakView.streak = streak
                
                stackView.addArrangedSubview(streakView)
                
                streakView.widthAnchor.constraintEqualToConstant(320).active = true
                streakView.heightAnchor.constraintEqualToConstant(75).active = true
                
                //stackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view":streakView]))
                //stackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view":streakView]))
            }
        }
        
        /*
        let service = StreakService()
        for _ in service.all()! {
            // let streakView = StreakView.instantiateFromNib(frame: CGRectZero, streak: streak, superView: stackView)
             let streakView = StreakView.instanceFromNib()
            
            stackView.addArrangedSubview(streakView)
            //stackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[streakView]|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["streakView": streakView]))
            //stackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[streakView]|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["streakView": streakView]))
            // view.addConstraint(NSLayoutConstraint(item: redView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: -30))
            //stackView.addConstraint(NSLayoutConstraint(item: streakView, attribute: .Width, relatedBy: .Equal, toItem: stackView, attribute: .Width, multiplier: 1.0, constant: -30))
        }*/
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

