//
//  UIImageView+imageFromUrl.swift
//  Photo-Search-Example
//
//  Created by Gene M. Angelo  Jr. on 9/29/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

extension UIImageView {
   
   // Loads the image asynchronously.
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
