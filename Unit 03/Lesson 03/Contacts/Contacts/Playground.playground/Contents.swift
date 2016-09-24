//: Playground - noun: a place where people can play

import UIKit





func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        results[0]
        return results.map { nsString.substring(with: $0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

/*
func matches2(for regex: String, in text: String) -> [String] {
    var error: NSError? = nil
    do {
        let regex = try NSRegularExpression(pattern: regex, options: NSRegularExpression.Options.DotMatchesLineSeparators, error: &error)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        results[0]
        return results.map { nsString.substring(with: $0.range)}
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}*/



let regexString = "^(?:(?:\\+?1\\s*(?:[-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$"
let regexMatches = matches(for: regexString, in: "1-201-230-8070")
//print(regexMatches)



extension String {
    func isValidPhoneNumber() -> Bool {
        let PHONE_REGEX = "^\\(\\d{3}\\)\\s\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    var phoneNumberParts : (areaCode: Int, first3: Int, last4: Int)? {
        if (!self.isValidPhoneNumber()) {
            return nil
        }
        
        var cleanPhoneNumber = self.replacingOccurrences(of: "(", with: " ")
        cleanPhoneNumber = cleanPhoneNumber.replacingOccurrences(of: ")", with: " ")
        cleanPhoneNumber = cleanPhoneNumber.replacingOccurrences(of: "-", with: " ")
        
        let phoneParts = cleanPhoneNumber.components(separatedBy: " ").filter { $0 != ""}

        return (areaCode: Int(phoneParts[0])!, first3: Int(phoneParts[1])!, last4: Int(phoneParts[2])!)
    }
}


var phoneNumber = "(201) 230-6770"
phoneNumber.isValidPhoneNumber()
phoneNumber.phoneNumberParts

phoneNumber = phoneNumber.replacingOccurrences(of: "(", with: " ").replacingOccurrences(of: ")", with: " ").replacingOccurrences(of: "-", with: " ")
let phoneParts = phoneNumber.components(separatedBy: " ").filter { $0 != ""}
phoneParts

if let parts = "(123) 456-7890".phoneNumberParts {
    print(parts)
}




