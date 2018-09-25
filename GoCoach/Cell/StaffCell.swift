//
//  StaffCell.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/25/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit

class StaffCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureStaffCell(staff:Staff){
        
        self.name.text = staff.first + " " + staff.last
        self.role.text = staff.role
        
    }

}
