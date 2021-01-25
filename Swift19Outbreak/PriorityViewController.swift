//
//  PriorityViewController.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import UIKit

class PriorityViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var PriorityTxt: UILabel!
    @IBOutlet weak var NumberInList: UILabel!
    @IBOutlet weak var PriorityLabel: UILabel!
    @IBOutlet weak var NumberInListLabel: UILabel!
    @IBOutlet weak var NoTestLabel: UILabel!
    
    var priority:Int=0
    var numberInList:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(priority == 0) {
            PriorityLabel.isHidden=true
            PriorityTxt.isHidden=true
            NumberInListLabel.isHidden=true
            NumberInList.isHidden=true
            NoTestLabel.isHidden=false
        } else {
            PriorityTxt.text="\(priority)"
            NumberInList.text="\(numberInList)"
        }
        
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
