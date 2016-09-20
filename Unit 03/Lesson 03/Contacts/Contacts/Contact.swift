//
//  Contact.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/18/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation


internal class Contact : NSObject {
    private var _name:String?
    private var _phoneNumber:PhoneNumber?
    
    override init() {
        self._name = nil
        self._phoneNumber = nil
    
        super.init()
    }
    
    init(name:String) {
        self._name = name
        self._phoneNumber = PhoneNumber()
        
        super.init()
    }
    
    init(name:String, areaCode:Int, firstThree:Int, lastFour:Int) {
        self._name = name
        self._phoneNumber = PhoneNumber(areaCode: areaCode, firstThree: firstThree, lastFour: lastFour)
        
        super.init()
    }
    
    init(name:String?, phoneNumber:PhoneNumber?) {
        self._name = name
        self._phoneNumber = phoneNumber
        
        super.init()
    }
    
    internal var name:String? {
        get { return _name }
        set { _name = newValue }
    }
    
    internal var phoneNumber:PhoneNumber? {
        get { return _phoneNumber }
        set { _phoneNumber = newValue }
    }
}
