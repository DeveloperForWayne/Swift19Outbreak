//
//  PatientTableViewCell.swift
//  Swift19Outbreak
//
//  Created by Wei Xu on 2020-04-10.
//  Copyright © 2020 Georgebrown. All rights reserved.
//

import UIKit

class PatientTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var PriorityLabel: UILabel!
    
    // MARK: Delegate
    var delegate:PatientCellDelegate?
    
    // MARK: custom properities
    var index:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupLabelTap()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        self.delegate?.nameLabelPressed(at: index)
    }
    
    func setupLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.NameLabel.isUserInteractionEnabled = true
        self.NameLabel.addGestureRecognizer(labelTap)
        
    }
}


protocol PatientCellDelegate {
    func nameLabelPressed(at indexPath:IndexPath)
}
