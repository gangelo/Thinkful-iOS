//
//  ViewController.swift
//  Web Service Example
//
//  Created by Gene M. Angelo  Jr. on 9/25/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    var activityIndicatorView:UIActivityIndicatorView? =  nil
    
    let openWeatherMapAPIKey = "YOUR_KEY"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.townLabel.text = ""
        self.forecastLabel.text = ""
        
        callWeatherService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callWeatherService() {
        let url = "http://api.openweathermap.org/data/2.5/weather?zip=07005,us&appid=\(openWeatherMapAPIKey)"
        
        // Alamofire call to fetch location data
        
        startActivityMonitor()
        
        Alamofire.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async(execute: {
                    // Delay for 4 seconds to simulate internet latency so we can see our
                    // activity monitor at work...
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                        self.endActivityMonitor()
                    
                        var townName = "Town Unavailable"
                        var townWeather = "Weather Unavailable"
                    
                        let json:JSON = JSON(data)
                        townName = self.getTownName(json: json) ?? townName
                        townWeather = self.getTownWeather(json: json) ?? townWeather
                    
                        self.townLabel.text = townName.localizedCapitalized
                        self.forecastLabel.text = townWeather.localizedCapitalized
                    }
                })
            case .failure(let error):
                self.endActivityMonitor()
                print(error)
            }
        }
    }
    
    func startActivityMonitor() {
        self.refreshButton.isEnabled = false
        
        // Instantiate a gray Activity Indicator View
        self.activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        
        // Add the activity to the ViewController's view
        view.addSubview(self.activityIndicatorView!)
        
        // Position the Activity Indicator View in the center of the view
        self.activityIndicatorView!.center = view.center
        
        // Tell the Activity Indicator View to begin animating
        self.activityIndicatorView!.startAnimating()
    }
    
    func endActivityMonitor() {
        self.activityIndicatorView!.removeFromSuperview()
        self.refreshButton.isEnabled = true
    }
    
    func getTownName(json: JSON) -> String? {
        return json["name"].string
    }
    
    func getTownWeather(json: JSON) -> String? {
        return json["weather"][0]["description"].string
    }
    
    @IBAction func refreshWeather() {
        callWeatherService()
    }
}

