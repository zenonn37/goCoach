//
//  TeamCell.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamDetail: UILabel!
    @IBOutlet weak var sport: UILabel!
    
    func configureTeam(team:Team){
        
        self.teamName.text = team.name
        self.teamDetail.text = team.level
        self.sport.text = team.sport
    }
    

}
