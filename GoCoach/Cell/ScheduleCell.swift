//
//  ScheduleCell.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/16/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var oponent: UILabel!
    @IBOutlet weak var gameTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(schedule:Schedule){
        
        if schedule.home != false {
            location.text = "VS"
        }else{
            location.text = "@"
        }
        
        
        day.text = "Sat"
        gameTime.text = schedule.eventTime
        oponent.text = schedule.name
        eventDate.text = schedule.eventDate
        
        
        
        
    }

}
