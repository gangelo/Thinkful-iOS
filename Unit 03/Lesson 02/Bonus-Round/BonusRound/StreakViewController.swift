//
//  StreakViewController.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/11/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

protocol StreakListUpdateDelegate {
    func addStreak(sender:StreakViewController, withStreak streak: Streak)
}

class StreakViewController: UIViewController {
    
    // MARK: Properties
    var _streak:Streak? = nil
    var _isEditMode:Bool = false
    var delegate: StreakListUpdateDelegate! = nil
    
    @IBOutlet weak var nameTextField: BottomBorderTextField!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (self.isEditMode) {
            if let streak = self.streak {
                self.nameTextField.text = streak.name
                self.countLabel.text = "Value: \(streak.count)"
                self.countStepper.value = Double(streak.count)
            }
        } else {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var streak : Streak? {
        get { return _streak }
        set { _streak = newValue }
    }
    
    var isEditMode: Bool {
        get { return _isEditMode }
        set { _isEditMode = newValue }
    }
    
    var isAddMode: Bool {
        get { return _isEditMode == false }
        set { _isEditMode = !newValue }
    }
    
    func vaidateInput(inout errorMessage: String) -> Bool {
        errorMessage = ""
        
        let name = nameTextField.text!.trim()

        if (name.characters.count == 0) {
            errorMessage.append("Name is required")
            return false
        }
        
        let service = StreakService()
        let exists = service.exists(streak!)
        
        if (isEditMode && !exists) {
            errorMessage.append("This streak no longer exists")
            return false
        }
        
        if (isAddMode && exists) {
            errorMessage.append("Name is already in use")
            return false
        }
        
        return true
    }
    
    func showMessage(message: String) {
        let alert = UIAlertController(title: "Attention", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateCountLabel() {
        let count = countStepper.value
        self.countLabel.text = "Value: \(count)"
    }
    
    @IBAction func onDoneClick(sender: UIBarButtonItem) {
        var message = ""
        
        if (!vaidateInput(&message)) {
            showMessage(message)
            return
        }
        
        streak!.name = nameTextField.text!
        streak!.count = UInt64(countStepper.value)
        
        let service = StreakService()
        service.addOrUpdate(streak!)
        
        delegate!.addStreak(self, withStreak: streak!)
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func onCancelClick(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func onTouchUpInside(sender: UIStepper) {
        self.updateCountLabel()
    }
    
}