//
//  TestViewController.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PatientCellDelegate {
    
    // MARK: Outlet
    @IBOutlet weak var PatientsTableView: UITableView!
    
    var patients:[Patient]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PatientsTableView.dataSource=self
        self.PatientsTableView.delegate=self
        
        let tabBar=tabBarController as! BaseTabBarController
        patients=tabBar.patients
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let tabBar=tabBarController as! BaseTabBarController
        tabBar.patients=patients
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar=tabBarController as! BaseTabBarController
        patients=tabBar.patients
        PatientsTableView.reloadData()
    }
    
    // The total number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        patients.count
    }
    
    // Content that display in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let patient:Patient = patients[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "NeedTestCell") as! PatientTableViewCell
        
        if (cell == nil) {
            cell = PatientTableViewCell(style: .default, reuseIdentifier: "NeedTestCell")
        }
        
        // setup the delegate
        cell.delegate = self
        cell.index = indexPath      // this .indexPath is a member variable of the PatientTableCell class
        
        
        // here is where you tell the table what the content in the row should be:
        let priority=patient.Priority
        
        cell.NameLabel.text = "\(patient.FirstName) \(patient.LastName)"
        cell.AgeLabel.text = "\(patient.Age)"
        cell.PriorityLabel.text = "\(priority)"
        if(priority==3) {
            cell.NameLabel.textColor = UIColor.red
            cell.AgeLabel.textColor = UIColor.red
            cell.PriorityLabel.textColor = UIColor.red
        } else if(priority==2) {
            cell.NameLabel.textColor = UIColor.yellow
            cell.AgeLabel.textColor = UIColor.yellow
            cell.PriorityLabel.textColor = UIColor.yellow
        } else if(priority==1) {
            cell.NameLabel.textColor = UIColor.green
            cell.AgeLabel.textColor = UIColor.green
            cell.PriorityLabel.textColor = UIColor.green
        }
        
        return cell
    }
    
    func nameLabelPressed(at indexPath: IndexPath) {
        let box = UIAlertController(
            title: "Test Complete Confirmation",
            message: "Is the patient's test complete?",
            preferredStyle: .alert
        )
        box.addAction(
            UIAlertAction(title:"Yes", style: .default, handler:{
                // mandatory code
                action in
                
                self.patients.remove(at: indexPath.row)
                
                let tabBar=self.tabBarController as! BaseTabBarController
                tabBar.patients=self.patients
                
                self.PatientsTableView.reloadData()
                
            })
        )
        box.addAction(
            UIAlertAction(title:"No", style: .default, handler:nil)
        )
        self.present(box, animated:true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
