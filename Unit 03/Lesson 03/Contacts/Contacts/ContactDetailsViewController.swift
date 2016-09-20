//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/19/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhone: UILabel!
    
    private var _contact:Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let contact = _contact {
            self.contactName.text = contact.name
            self.contactPhone.text = contact.phoneNumber.getFormattedPhoneNumber()
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
    
    public var contact:Contact? {
        get { return _contact }
        set { _contact = newValue }
    }
    
    @IBAction func unwindToContactsTableViewController(segue : UIStoryboardSegue) {
    }
}
