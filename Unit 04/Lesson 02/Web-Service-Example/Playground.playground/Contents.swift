//: Playground - noun: a place where people can play

import UIKit



func convertStringToDictionary(text: String) -> [String:AnyObject]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
        } catch let error as NSError {
            print(error)
        }
    }
    return nil
}

let jsonString = "{\"coord\":{\"lon\":-74.41,\"lat\":40.9},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":286.92,\"pressure\":1019,\"humidity\":68,\"temp_min\":280.37,\"temp_max\":292.04},\"wind\":{\"speed\":1.51,\"deg\":91.5},\"clouds\":{\"all\":0},\"dt\":1474853712,\"sys\":{\"type\":3,\"id\":211098,\"message\":0.0168,\"country\":\"US\",\"sunrise\":1474886984,\"sunset\":1474930023},\"id\":5095826,\"name\":\"Boonton\",\"cod\":200}"

let json = convertStringToDictionary(text: jsonString)



print(json?["name"] as! String)

/*
let weatherJsonDictionary = (json?["weather"] as! [AnyObject])[0] as? [String:AnyObject]
print(weatherJsonDictionary?["description"])
*/

if let weatherObject = json?["weather"] as? [AnyObject] {
    if let weatherObjectElements = weatherObject[0] as? [String:AnyObject]  {
        if let weatherDescription = weatherObjectElements["description"] {
            print(weatherDescription)
        }
    }
}

print(json)














