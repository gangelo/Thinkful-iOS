//
//  ViewController.swift
//  Web Service Example
//
//  Created by Gene M. Angelo  Jr. on 9/25/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

typealias NSURLSessionDataTask = URLSessionDataTask

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var forecastLabel: UILabel!
    
    let openWeatherMapAPIKey = "26dbfb618c1ecc3f6c0018e15705677a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        callWeatherService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callWeatherService() {
       let url = "http://api.openweathermap.org/data/2.5/weather?zip=07005,us&appid=\(openWeatherMapAPIKey)"
        
        // Alamofire call to fetch location data
        
        request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async(execute: {
                    var townName = "Town Unavailable"
                    var townWeather = "Weather Unavailable"
                    
                    if let json = data as? Dictionary<String, AnyObject> {
                        townName = self.getTownName(json: json) ?? townName
                        townWeather = self.getTownWeather(json: json) ?? townWeather
                    }
                    
                    self.forecastLabel.text = "\(townName) \(townWeather)"
                })
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTownName(json: Dictionary<String, AnyObject>) -> String? {
        return json["name"] as? String ?? nil
    }
    
    func getTownWeather(json: Dictionary<String, AnyObject>) -> String? {
        if let weatherObject = json["weather"] as? [AnyObject] {
            if let weatherObjectElements = weatherObject[0] as? [String:AnyObject]  {
                if let weatherDescription = weatherObjectElements["description"] {
                    return weatherDescription as? String
                }
            }
        }
        return nil
    }
}

