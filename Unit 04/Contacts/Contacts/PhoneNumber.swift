//
//  PhoneNumber.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/18/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

internal class PhoneNumber {
    fileprivate var _areaCode:Int
    fileprivate var _firstThree:Int
    fileprivate var _lastFour:Int
    
    init() {
        self._areaCode = 0
        self._firstThree = 0
        self._lastFour = 0
    }
    
    init(areaCode:Int, firstThree:Int, lastFour:Int) {
        self._areaCode = areaCode
        self._firstThree = firstThree
        self._lastFour = lastFour
    }
    
    open var areaCode:Int {
        get { return _areaCode }
        set { _areaCode = newValue }
    }
    
    open var firstThree:Int {
        get { return _firstThree }
        set { _firstThree = newValue }
    }
    
    open var lastFour:Int {
        get { return _lastFour }
        set { _lastFour = newValue }
    }
    
    open func IsEmpty() -> Bool {
        return (areaCode == 0 && firstThree == 0 && lastFour == 0)
    }
    
    open func getFormattedPhoneNumber() -> String {
        return "(\(_areaCode)) \(_firstThree)-\(_lastFour)"
    }
    
    open func getFormattedPhoneNumberOrDefault(_ defaultValue:String) -> String {
        return IsEmpty() ? defaultValue : getFormattedPhoneNumber()
    }
}
