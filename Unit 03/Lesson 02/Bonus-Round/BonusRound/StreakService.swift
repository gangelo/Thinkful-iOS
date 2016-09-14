//
//  StreakService.swift
//  BonusRound
//
//  Created by Gene M. Angelo  Jr. on 9/13/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import Foundation

public class StreakService {
    private static var repository = [
            "Vitamins" : Streak(name: "Vitamins", count: 0),
            "Snak" : Streak(name: "Snak", count: 0)]
    
    init() {
        self.addOrUpdate(Streak(name: "Vitamins", count: 0))
    }
    
    public func addOrUpdate(streak: Streak) {
        if (self.dynamicType.repository[streak.name] == nil) {
            self.dynamicType.repository[streak.name] = streak
        } else {
            self.dynamicType.repository.updateValue(streak, forKey: streak.name)
        }
        self.description()
    }
    
    public func delete(streak: Streak) {
        self.dynamicType.repository.removeValueForKey(streak.name)
    }
    
    public func exists(streak: Streak) -> Bool {
        return self.dynamicType.repository[streak.name] != nil
    }
    
    public func description() {
        print(self.dynamicType.repository)
    }
}