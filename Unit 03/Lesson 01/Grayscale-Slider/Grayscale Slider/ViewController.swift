//
//  ViewController.swift
//  Grayscale Slider
//
//  Created by Gene M. Angelo  Jr. on 9/3/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var grayScaleSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetSlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetSlider() {
        grayScaleSlider.value = 0.5
        sliderDidChangeValue(grayScaleSlider)
    }
    
    @IBAction func sliderDidChangeValue(sender: UISlider) {
        print(sender.value)
        view.backgroundColor = UIColor(white: CGFloat(sender.value), alpha: 1)
    }

}

