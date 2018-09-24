//
//  TeamDashboardVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class TeamDashboardVC: UIViewController {
    
    let realm = try! Realm()
    
    var teamDash:Team?

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var sport: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let team = teamDash {
            nameLBL.text = team.name
            sport.text = team.sport
        }

}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tm = teamDash {
             let teams = realm.objects(Team.self).filter("id = '\(tm.id)'")
              nameLBL.text = teams[0].name
              sport.text = teams[0].sport
        }
       
    }

    @IBAction func backToList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editTeamInfo(_ sender: Any) {
        performSegue(withIdentifier: "editTeam", sender: self)
        
    }
    @IBAction func newPlayer(_ sender: Any) {
        
        performSegue(withIdentifier: "newPlayer", sender: self)
        
    }
    @IBAction func playlerTable(_ sender: Any) {
        performSegue(withIdentifier: "playerTable", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTeam" {
            let editTeam = segue.destination as! EditTeamVC
            editTeam.teamEdit = teamDash
        }else if segue.identifier == "newPlayer"{
            let newPlayer = segue.destination as! CreatePlayerVC
            newPlayer.selectedTeam = teamDash
        }else if segue.identifier == "playerTable"{
            let playerTable = segue.destination as! PlayerVC
            playerTable.selectedTeam = teamDash
            print(teamDash)
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
