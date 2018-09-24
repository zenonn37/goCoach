//
//  PlayerCell.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/23/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var uniformNumberLbl: UILabel!
    
    
    func configureCell(player:Roster){
        
        nameLbl.text = player.first + " " + player.last
        playerImage.image = UIImage(named: "94.jpg")
        //positionLbl.text = "LB,WR"
        uniformNumberLbl.text = "45"
      
        
        
       
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
