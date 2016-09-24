//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/19/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

let regexPattern = "^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$"

extension String {
    func capturedGroups(withRegex pattern: String) -> [String]? {
        var regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators])
        } catch {
            return nil
        }
        
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, utf16.count))
        
        guard let match = matches.first else { return nil }
        
        // Note: Index 1 is 1st capture group, 2 is 2nd, ..., while index 0 is full match which we don't use
        let lastRangeIndex = match.numberOfRanges - 1
        guard lastRangeIndex >= 1 else { return nil }
        
        var results = [String]()
        
        for i in 1...lastRangeIndex {
            let capturedGroupIndex = match.rangeAt(i)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
        }
        
        return results
    }
}

class ContactDetailsViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    
    fileprivate var _contact:Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contactName.delegate = self
        self.contactPhone.delegate = self
        
        self.contactName.placeholder = "Name"
        self.contactPhone.placeholder = "Phone"
        
        if let contact = _contact {
            self.contactName.text = contact.name.isNilOrEmpty() ? "" : contact.name
            self.contactPhone.text = contact.phoneNumber?.getFormattedPhoneNumber() ?? ""
        } else {
            self.contactName.text = ""
            self.contactPhone.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    open var contact:Contact? {
        get { return _contact }
        set { _contact = newValue }
    }
    
    @IBAction func unwindToContactsTableViewController(_ segue : UIStoryboardSegue) {
        // Nothing goes here
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.contactName {
            if let contactName = self.contactName.text {
             _contact?.name = contactName
            }
        } else if textField == self.contactPhone {
            if self.contactPhone.text != nil {
                let contactPhone = self.contactPhone.text
                let groups = contactPhone?.capturedGroups(withRegex: regexPattern)
                let _ = groups?.count
            }

        }
    }
    
    func validate() -> Bool {
        return false
    }
}
