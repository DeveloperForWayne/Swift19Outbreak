//
//  Patient.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import Foundation

class Person{
    var FirstName:String
    var LastName:String
    var Birthday:Date
    var RecentlyTravelled:Bool
    
    init(FirstName:String, LastName:String, Birthday:Date, RecentlyTravelled:Bool) {
        self.FirstName=FirstName
        self.LastName=LastName
        self.Birthday=Birthday
        self.RecentlyTravelled=RecentlyTravelled
    }
}
