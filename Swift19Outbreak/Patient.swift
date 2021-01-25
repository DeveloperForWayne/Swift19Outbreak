//
//  Patient.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

class Patient:Person{
    var Age:Int
    var Priority:Int
    
    init(person: Person, age: Int, priority: Int) {
        self.Age=age
        self.Priority=priority
        
        super.init(FirstName: person.FirstName, LastName: person.LastName, Birthday: person.Birthday, RecentlyTravelled: person.RecentlyTravelled)
        
    }
}
