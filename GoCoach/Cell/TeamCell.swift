//
//  TeamCell.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class TeamCell: UITableViewCell {
    
      var schedule:List<Schedule>?
    
    
     var opp = ""
    var wins = 0
    var lose = 0
    var opPoints = 0
    var tePoints = 0
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var sport: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var advantage: UILabel!
    @IBOutlet weak var opponent: UILabel!
   
    @IBOutlet weak var teamWins: UILabel!
    @IBOutlet weak var teamLoses: UILabel!
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet weak var teamPoints: UILabel!
    @IBOutlet weak var opponentPoints: UILabel!
    
    @IBOutlet weak var loses: UILabel!
    func configureTeam(team:Team){
        
        teamName.text = team.name
        sport.text = team.sport
        teamLogo.image = UIImage(named: "logo_1")
        
        
        
        for sch in team.schedule {
            print(sch.name)
            opp = sch.name
            
            wins += sch.win
            lose += sch.lose
            tePoints = sch.teamScore
            opPoints = sch.opponentScore
            
        }
        
        teamWins.text = String(wins)
        teamLoses.text = String(lose)
        
        print(opp)
        opponent.text = opp
        teamPoints.text = String(tePoints)
        opponentPoints.text = String(opPoints)
    }
    

}
