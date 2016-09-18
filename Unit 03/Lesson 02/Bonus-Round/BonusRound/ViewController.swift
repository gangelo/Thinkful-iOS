//
//  ViewController.swift
//  Unit03Lesson02_06_BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/6/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StreakListUpdateDelegate {

    // MARK: Properties
    private var scrollView: UIScrollView!
    private var stackView: UIStackView!
    
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
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        
        let service = StreakService()
        for streak in service.all()! {
            addStreakToStackView(streak)
        }
    }
    
    internal func addStreak(sender:StreakViewController, withStreak streak: Streak) {
        addStreakToStackView(streak)
    }
    
    private func addStreakToStackView(streak: Streak) {
        if let streakView = NSBundle.mainBundle().loadNibNamed("StreakView", owner: stackView, options: nil).first as? StreakView {
            streakView.streak = streak
            
            stackView.addArrangedSubview(streakView)
            
            streakView.widthAnchor.constraintEqualToConstant(320).active = true
            streakView.heightAnchor.constraintEqualToConstant(75).active = true
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
                
                streakViewController.delegate = self
                
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

