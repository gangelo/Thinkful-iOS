//
//  ViewController.swift
//  Photo-Search-Example
//
//  Created by Gene M. Angelo  Jr. on 9/27/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: Properties
    var activityIndicatorView:UIActivityIndicatorView? =  nil
    
    static let flickrAPIKey = "7d8bb9f7520faecd8e1bf908f7ecdde5"
    let flickrSearchParameters = ["method": "flickr.photos.search",
                            "api_key": flickrAPIKey,
                            "format": "json",
                            "nojsoncallback": 1,
                            "text": "dogs",
                            "extras": "url_m",
                            "per_page": 5] as [String : Any]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callFickrService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    func callFickrService() {
        let url = "https://api.flickr.com/services/rest/"
        
        // Alamofire call to fetch location data
        
        startActivityMonitor()
        
        Alamofire.request(url, method: .get, parameters: flickrSearchParameters).responseJSON { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async(execute: {
                    self.endActivityMonitor()
                    let json:JSON = JSON(data)
                    print(json)
                })
            case .failure(let error):
                self.endActivityMonitor()
                print(error)
            }
        }
    }
    
    func startActivityMonitor() {
        //self.refreshButton.isEnabled = false
        
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
        //self.refreshButton.isEnabled = true
    }
}

