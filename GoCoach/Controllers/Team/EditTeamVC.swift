//
//  EditTeamVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/18/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class EditTeamVC: UIViewController {
    
    let realm = try! Realm()
    
    var teamEdit:Team?

    @IBOutlet weak var teamNameField: UITextField!
    @IBOutlet weak var teamLabl: UILabel!
    @IBOutlet weak var sport: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var season: UITextField!
    @IBOutlet weak var level: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let team = teamEdit {
            teamNameField.text = team.name
            teamLabl.text = team.name
            sport.text = team.sport
            gender.text = team.gender
            season.text = team.season
            level.text = team.level
        }else{
            debugPrint("no data")
        }
    }
    
    
    

   
    
    @IBAction func updateTeams(_ sender: Any) {
        update()
    }
    
    @IBAction func cancelUpdate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func update(){
        
        if let t = teamEdit {
            let teams = Team()
            
            
            //team.name = teamNameField.text!
            teams.name = teamNameField.text!
            teams.sport = sport.text!
            teams.gender = gender.text!
            teams.season = season.text!
            teams.level = level.text!
            teams.id = t.id
            
            do{
                try realm.write {
                    realm.add(teams, update: true)
                    dismiss(animated: true, completion: nil)
                    print(t.id)
                }
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
      
    }
    
    

}
