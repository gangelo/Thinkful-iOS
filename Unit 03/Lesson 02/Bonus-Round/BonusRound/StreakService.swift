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
            "Streak0" : Streak(name: "Streak0", count: 0),
            "Streak1" : Streak(name: "Streak1", count: 0),
            "Streak2" : Streak(name: "Streak2", count: 0),
            "Streak3" : Streak(name: "Streak3", count: 0),
            "Streak4" : Streak(name: "Streak4", count: 0),
            "Streak5" : Streak(name: "Streak5", count: 0),
            "Streak6" : Streak(name: "Streak6", count: 0),
            "Streak7" : Streak(name: "Streak7", count: 0),
            "Streak8" : Streak(name: "Streak8", count: 0),
            "Streak9" : Streak(name: "Streak9", count: 0),
            "Streak10" : Streak(name: "Streak10", count: 0),
            "Streak11" : Streak(name: "Streak11", count: 0),
            "Streak12" : Streak(name: "Streak12", count: 0),
            "Streak13" : Streak(name: "Streak13", count: 0),
            "Streak14" : Streak(name: "Streak14", count: 0),
            "Streak15" : Streak(name: "Streak15", count: 0)]
    
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
        return self.exists(streak.name)
    }
    
    public func exists(streakName: String) -> Bool {
        return self.dynamicType.repository[streakName] != nil
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