//
//  TeamVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class TeamVC: UIViewController {
    
    
    let realm = try! Realm()

    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var sportType: UITextField!
    @IBOutlet weak var teamGender: UITextField!
    @IBOutlet weak var sportSeason: UITextField!
    @IBOutlet weak var teamLevel: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    

    @IBAction func goBackHome(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
    }
    @IBAction func createTeamPressed(_ sender: Any) {
        print("new team")
        saveNewTeam()
    }
    
    private func saveNewTeam(){
        //setup object
        let team = Team()
        
        //set class var
        team.name = teamName.text!
        team.sport = sportType.text!
        team.gender = teamGender.text!
        team.season = sportSeason.text!
        team.level = teamLevel.text!
        
        //try to create team
        
        do{
            try realm.write {
                realm.add(team)
                debugPrint("saved")
                performSegue(withIdentifier: "teamDash", sender: self)
            }
        }catch{
            debugPrint(error.localizedDescription)
        }
        
        
    }
    
    
    
    
}

