//
//  PhoneTextField.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/24/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class PhoneTextField: UITextField {
    
    // MASK: Propeties
    let phoneRegex = "^\\(\\d{3}\\)\\s\\d{3}-\\d{4}$"
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.placeholder = "Phone Number (123) 456-7890"
        self.keyboardType = .numberPad
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func isValid() -> Bool {
        if let inputText = self.text {
            let PHONE_REGEX = self.phoneRegex
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result =  phoneTest.evaluate(with: inputText)
            
            return result
        } else {
            return false
        }
    }
    
    var phoneNumberParts : (areaCode: Int, first3: Int, last4: Int)? {
        if (!self.isValid()) {
            return nil
        }
        
        if let inputText = self.text {
            var cleanPhoneNumber = ""
            
            cleanPhoneNumber = inputText.replacingOccurrences(of: "(", with: " ")
            cleanPhoneNumber = cleanPhoneNumber.replacingOccurrences(of: ")", with: " ")
            cleanPhoneNumber = cleanPhoneNumber.replacingOccurrences(of: "-", with: " ")
        
            let phoneParts = cleanPhoneNumber.components(separatedBy: " ").filter { $0 != ""}
        
            return (areaCode: Int(phoneParts[0])!, first3: Int(phoneParts[1])!, last4: Int(phoneParts[2])!)
        } else {
            return nil
        }
    }

}
