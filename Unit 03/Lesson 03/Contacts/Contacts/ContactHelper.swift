//
//  ContactHelper.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/18/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

internal class ContactHelper {
    fileprivate static let _instance = ContactHelper()
    fileprivate var _contacts = [Contact]()
    fileprivate let _names = [
        "Latoyia Brisker",
        "Olivia Westray",
        "Tanja Hawk",
        "Elin Dudley",
        "Katlyn Nagata",
        "Wiley Satter",
        "Verdie Weyer",
        "Garrett Seamon",
        "Fidelia Salls",
        "Demetria Higdon",
        "Cory Brownlee",
        "Rodrigo Gershman",
        "Robt Soles",
        "Leonore Axelson",
        "Reginald Janson",
        "Mendy Phelps",
        "Amee Caulkins",
        "Micha Tourville",
        "Dena Penaflor",
        "Hildegarde Yi",
        "Lucy Didonato",
        "Terina Febres",
        "Sheldon Buchannon",
        "Georgina Earley",
        "Vonda Rust",
        "Bong Castillon",
        "Rachelle Gallivan",
        "Reuben Wallander",
        "Elmo Donatelli",
        "Kasey Longnewhard Longfellow"]
    
    fileprivate init() {
    }
    
    internal static var instance:ContactHelper {
        get { return _instance }
    }
    
    internal func getContacts() -> [Contact] {
        if (_contacts.count == 0) {
            loadContacts()
        }
        return _contacts
    }
    
    internal func deleteContact(_ contact:Contact) -> Contact? {
        if let index = _contacts.index(of: contact) {
            return _contacts.remove(at: index)
        }
        
        return nil
    }
    
    internal func removeAtInded(_ index: Int) -> Contact {
        return _contacts.remove(at: index)
    }
    
    internal func insert(_ contact: Contact, at: Int) {
        _contacts.insert(contact, at: at)
    }
    
    fileprivate func loadContacts() {
        for name in _names {
            let _phoneNumber:PhoneNumber? = chance(oneIn: 5) ? nil : getPhoneNumber()
            
            var _name = ""
            
            if (_phoneNumber == nil) {
                _name = name
            } else {
                _name = chance(oneIn: 5) ? "" : name
            }
            
            _contacts.append(Contact(name: _name, phoneNumber: _phoneNumber))
        }
    }
    
    fileprivate func getPhoneNumber() -> PhoneNumber {
        let areaCode = 973
        let firstThree = Int(arc4random_uniform(100) + 101)
        let lastFour = Int(arc4random_uniform(1000) + 1001)
        
        return PhoneNumber(areaCode: areaCode, firstThree: firstThree, lastFour: lastFour)
    }
    
    fileprivate func chance(oneIn max: UInt32) -> Bool {
        return (arc4random_uniform(max) + 1) == max
    }
}
