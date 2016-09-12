//
//  NewStreakViewController.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/11/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class NewStreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Properties
    var pickerDataSource = ["Daily", "Weekly", "Montly", "Yearly"];
    
    @IBOutlet weak var streakTypePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.streakTypePicker.dataSource = self;
        self.streakTypePicker.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    @IBAction func onDoneClick(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func onCancelClick(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
}