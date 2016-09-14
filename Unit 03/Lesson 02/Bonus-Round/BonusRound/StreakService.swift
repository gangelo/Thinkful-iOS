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
        self.description()
    }
    
    public func exists(streak: Streak) -> Bool {
        return self.dynamicType.repository[streak.name] != nil
    }
    
    public func all() -> Array<Streak>?  {
        var all = Array<Streak>()
        
        for (_, streak) in self.dynamicType.repository {
            all.append(streak)
        }
        
        return all
    }
    
    public func description() {
        print("\nDisplaying streaks...")
        
        for (_, streak) in self.dynamicType.repository {
            print("Steak name: \(streak.name), count: \(streak.count)")
        }
        
        print("Streak count: \(self.dynamicType.repository.count)")
    }
}