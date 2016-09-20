//
//  ContactHelper.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/18/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

internal class ContactHelper {
    private static let _instance = ContactHelper()
    private var _contacts = [Contact?]()
    private let _names = [
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
        "Kasey Newhard"]
    
    private init() {
    }
    
    internal static var instance:ContactHelper {
        get { return _instance }
    }
    
    internal func getContacts() -> [Contact] {
        if (_contacts.count == 0) {
            for name in _names {
                _contacts.append(Contact(name: name, phoneNumber: getPhoneNumber()))
            }
        }
        return _contacts as! [Contact]
    }
    
    private func getPhoneNumber() -> PhoneNumber {
        let areaCode = 973
        let firstThree = Int(arc4random_uniform(999) + 1)
        let lastFour = Int(arc4random_uniform(999) + 1)
        
        return PhoneNumber(areaCode: areaCode, firstThree: firstThree, lastFour: lastFour)
    }
}









