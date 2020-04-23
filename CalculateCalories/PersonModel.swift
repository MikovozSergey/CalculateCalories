//
//  PersonModel.swift
//  CalculateCalories
//
//  Created by Дарья Станкевич on 4/22/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

struct Person {
    
    var name: String
    var currentWeight: String?
    var image: UIImage?
    var personImage: String?
    var age: String?
    var height: String?
    var desiredWeight: String?
    var sexSegmentControl: Int?
    var activitiSegmentControl: Int?
    var essentialColories: String?
    
    static let personsProfiles = ["Ekaterina", "Alexander", "Sergey"]
    
    static func getPersons() -> [Person] {
        var persons = [Person]()
        
        for person in personsProfiles {
            persons.append(Person(name: person, currentWeight: "80", image: UIImage(named: person), personImage: "Ekaterina", age: "20", height: "200", desiredWeight: "60", sexSegmentControl: 1, activitiSegmentControl: 2, essentialColories: "2000"))
        }
        
        return persons
    }
}
