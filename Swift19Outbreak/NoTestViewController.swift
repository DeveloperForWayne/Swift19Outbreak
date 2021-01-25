//
//  NoTestViewController.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import UIKit

class NoTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var persons:[Person]=[]
    
    // MARK: Outlets
    @IBOutlet weak var NoTestTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.NoTestTableView.dataSource=self
        self.NoTestTableView.delegate=self
        
        let tabBar=tabBarController as! BaseTabBarController
        persons=tabBar.persons
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar=tabBarController as! BaseTabBarController
        persons=tabBar.persons
        NoTestTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NoTestCell")
        
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default,
                reuseIdentifier: "NoTestCell")
        }
        
        cell?.textLabel?.text = "\(persons[indexPath.row].FirstName) \(persons[indexPath.row].LastName)"
        
        return cell!
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
