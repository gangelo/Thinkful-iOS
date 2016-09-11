//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Gene M. Angelo  Jr. on 9/3/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let startValue = Float(255.0)
        
        redSlider.value = startValue
        greenSlider.value = startValue
        blueSlider.value = startValue
        
        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateBackgroundColor() {
        // Update the view's background color...
        let color = UIColor(red: redSlider.value.toRgbValue, green: greenSlider.value.toRgbValue, blue: blueSlider.value.toRgbValue, alpha: 100.0)
        self.view.backgroundColor = color
        
        // Update out color buttons...
        redButton.backgroundColor = redSlider.value.toUIColorRed
        greenButton.backgroundColor = greenSlider.value.toUIColorGreen
        blueButton.backgroundColor = blueSlider.value.toUIColorBlue
        
        print("RGB: \(color.description)")
    }
    
    @IBAction func updateBackgroundColor(_: AnyObject) {
        updateBackgroundColor()
    }
}

