//
//  ViewController.swift
//  Photo-Search-Example
//
//  Created by Gene M. Angelo  Jr. on 9/27/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    func imageFromUrl(url: URL) {
        DispatchQueue.main.async(execute: {
            do {
                let imageData:Data? = try Data(contentsOf: url)
                if let imageDataUnWrapped = imageData {
                    let image = UIImage(data: imageDataUnWrapped)
                    self.image = image
                }
            } catch {
                print("Error: UIImageView.imageFromUrl: The image was not created")
            }
        })
    }
}


class ViewController: UIViewController {
    
    // MARK: Properties
    var activityIndicatorView:UIActivityIndicatorView? =  nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    
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
                    let json:JSON = JSON(data)
                    let imageUrls = self.getImageUrls(json: json)
                    
                    self.scrollView.contentSize = CGRect(x: 0, y: 0, width: Int(320), height: Int(320 * imageUrls.count)).size
                    
                    for (index, photoUrl) in imageUrls.enumerated() {
                        if let imageUrl = URL(string: photoUrl) {
                            //let imageData:Data? = try Data(contentsOf: URL(string: photoUrl)!)
                            //if let imageDataUnWrapped = imageData {
                                let imageView = UIImageView(frame: CGRect(x: 0, y: 320 * CGFloat(index), width: 320, height: 320))
                            
                                imageView.imageFromUrl(url: imageUrl)
                                //let imageView = UIImageView(image: image)
                                //imageView.frame = CGRect(x: 0, y: 320 * CGFloat(index), width: 320, height: 320)
                                self.scrollView.addSubview(imageView)

                            //}
                       }
                    }
                    
                    self.endActivityMonitor()
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
    
    func getImageUrls(json: JSON) -> [String] {
        var urls = [String]()
        
        for index in 0..<json["photos"]["photo"].count {
            if let url = json["photos"]["photo"][index]["url_m"].string {
                urls.append(url)
            }
        }
        
        return urls
    }
}

