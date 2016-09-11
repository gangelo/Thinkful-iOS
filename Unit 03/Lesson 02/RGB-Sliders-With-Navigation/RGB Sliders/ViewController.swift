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
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let color = defaults.uiColorForKey("openColor", defaultColor: UIColor.whiteColor())
        let rgb = color.toRGB()
        
        redSlider.value = rgb.red * 255.0
        greenSlider.value = rgb.green * 255.0
        blueSlider.value = rgb.blue * 255.0
        
        setSliderColor()
        
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateColor(_: AnyObject) {
        setSliderColor()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  let identifier = segue.identifier {
            let destinationViewController = segue.destinationViewController
            
            switch(identifier) {
                case "openColor":
                    destinationViewController.view.backgroundColor = colorSquare.backgroundColor
                default:
                    break
            }
        }
    }
    
    func getSliderColor() -> UIColor {
        return UIColor(red: redSlider.value.toRgbValue, green: greenSlider.value.toRgbValue, blue: blueSlider.value.toRgbValue, alpha: 100.0)
    }

    func setSliderColor() {
        let color = getSliderColor()
        self.colorSquare.backgroundColor = color
    }
    
    @IBAction func saveSliderColor(_: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setUIColor(getSliderColor(), forKey: "openColor")
        defaults.synchronize()
    }
}

