//
//  PersonModel.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import Foundation

struct Person {
    
    var name: String
    var currentWeight: Int
    var image: String
    var age: Int?
    var height: Int?
    var desiredWeight: Int
    var sexSegmentControl: Int?
    var activitiSegmentControl: Int?
    var essentialColories: Int
    
    static let personsProfiles = ["Ekaterina", "Alexander", "Sergey"]
    
    static func getPersons() -> [Person] {
        var persons = [Person]()
        
        for person in personsProfiles {
            persons.append(Person(name: person, currentWeight: 80, image: person, age: nil, height: nil, desiredWeight: 60, sexSegmentControl: nil, activitiSegmentControl: nil, essentialColories: 2000))
        }
        
        return persons
    }
}
