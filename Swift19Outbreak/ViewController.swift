//
//  ViewController.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-09.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var FirstnameTxt: UITextField!
    @IBOutlet weak var LastnameTxt: UITextField!
    @IBOutlet weak var BirthdayPicker: UIDatePicker!
    @IBOutlet weak var TravelledSwitch: UISwitch!
    
    var patients:[Patient] = []
    var persons:[Person] = []
    
    //MARK: Default functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar=tabBarController as! BaseTabBarController
        patients=tabBar.patients
        persons=tabBar.persons
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar=tabBarController as! BaseTabBarController
        patients=tabBar.patients
        persons=tabBar.persons
    }
    
    // Sender
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(FirstnameTxt.text=="" || LastnameTxt.text=="") {
            let box = UIAlertController(
                title: "Input Error",
                message: "Please input both firstname and lastname!",
                preferredStyle: .alert
            )
            box.addAction(
                UIAlertAction(title:"OK", style: .default, handler:nil)
            )
            self.present(box, animated:true)
            return
        } else {
            let birthday=BirthdayPicker.date
            var priority=0
            var waitingNo=0
            
            // Caculate age
            let today = Date()
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([.year, .month, .day], from: birthday, to: today)
            
            let age = components.year!
            let travelled=TravelledSwitch.isOn
            
            // Priority caculation
            if(travelled==false) {
                if(age>65) {
                    priority=2
                } else {
                    priority=0
                }
            } else {
                if(age>65) {
                    priority=3
                } else {
                    priority=1
                }
            }
            
            let person = Person(FirstName: FirstnameTxt.text!, LastName: LastnameTxt.text!, Birthday: birthday, RecentlyTravelled: travelled)
            
            let resultController = segue.destination as! PriorityViewController
            
            if(priority == 0) {
                // Passing person to no need tested
                persons.append(person)
                
                persons.sort{
                    $0.FirstName < $1.FirstName
                }
                
            } else {
                // Passing patient to need tested
                let newPatient=Patient(person: person, age: age, priority: priority)
                patients.append(newPatient)
                patients.sort {
                    $0.Priority > $1.Priority
                }
                waitingNo=patients.firstIndex(where: {$0.FirstName == person.FirstName && $0.LastName == person.LastName})! +  1
                
            }
            
            resultController.priority=priority
            resultController.numberInList = waitingNo
            
            let tabBar=tabBarController as! BaseTabBarController
            tabBar.patients=patients
            tabBar.persons=persons
            
        }
    }
    
}

