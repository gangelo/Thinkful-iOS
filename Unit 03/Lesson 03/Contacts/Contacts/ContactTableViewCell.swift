//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/19/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var contactInfo: UILabel!
    
    private var _contact:Contact?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public var contact:Contact {
        get { return _contact! }
        set {
            _contact = newValue
            initUI()
        }
    }
    
    private func initUI() {
        if let contact = self._contact {
            self.contactInfo.text = "\(contact.name) \(contact.phoneNumber.getFormattedPhoneNumber())"
        } else {
            self.contactInfo.text = "?"
        }
    }
}
