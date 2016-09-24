//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/19/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit


class ContactDetailsViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: PhoneTextField!
    
    fileprivate var _contact:Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contactName.delegate = self
        self.contactPhone.delegate = self
        
        self.contactName.placeholder = "Name"
        
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
            let parts = self.contactPhone.phoneNumberParts
            if let parts = parts {
                if let phoneNumber = _contact?.phoneNumber {
                    phoneNumber.areaCode = parts.areaCode
                    phoneNumber.firstThree = parts.first3
                    phoneNumber.lastFour = parts.last4
                } else {
                    _contact?.phoneNumber = PhoneNumber(areaCode: parts.areaCode, firstThree: parts.first3, lastFour: parts.last4)
                }
            }
        }
    }
    
    func validate() -> Bool {
        return false
    }
}
