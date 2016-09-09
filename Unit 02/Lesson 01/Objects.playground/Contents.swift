//: Playground - noun: a place where people can play

import UIKit

class Person {
    var name:String
    var gender:String
    var profession:String
    var location:String
    var age:Int
    
    var partner: Person?
    
    init(name:String,gender:String,profession:String,location:String,age:Int) {
        self.name=name
        self.gender=gender
        self.profession=profession
        self.location=location
        self.age=age
    }
    
    init(name:String) {
        self.name = name
        self.gender = "Male"
        self.profession = "Unknown"
        self.location = "Unknown"
        self.age = -1
    }
    
    func displayRelationshipMessage() {
        if let partner = partner {
            print("\(name) is in a relationship with \(partner.name)")
        } else {
            print("\(name) is not in a relationship")
        }
    }
    
    func createRelationship(partner: Person) -> Person {
        self.destroyRelationship()
        
        self.partner = partner
        self.partner!.partner = self
        
        return partner
    }
    
    func destroyRelationship() {
        if (isInRelationship()) {
            self.partner?.partner = nil
            self.partner = nil
        }
    }
    
    func isInRelationship() -> Bool {
        return self.partner != nil
    }
}

var peter = Person(name: "Peter", gender: "Male", profession: "Software Developer", location: "New York City", age:34)
var pat = Person(name: "Pat")

var amy = Person(name: "Amy", gender: "Female", profession: "Little Hottie", location: "New Jersey", age:42)
var gene = Person(name: "Gene", gender: "Male", profession: "Consultant", location: "New Jersey", age: 52)

amy = gene.createRelationship(amy)
print(gene.partner?.name)
print(amy.partner?.name)

amy.displayRelationshipMessage()
gene.displayRelationshipMessage()

gene.destroyRelationship()
print(gene.partner?.name)
print(amy.partner?.name)




