//
//  ResultTabBarViewController.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import UIKit

class ResultTabBarViewController: UITabBarController {
    
    var patient:Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ResultPage = segue.destination as! PriorityViewController
        ResultPage.patient = patient!
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
